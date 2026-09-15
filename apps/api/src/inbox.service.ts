import { Injectable, NotFoundException } from '@nestjs/common';
import { ChannelType as PrismaChannelType, Prisma } from '@miruslug/database';
import { PrismaService } from './prisma.service';
import { QueueService } from './queue.service';
import type { InboundMessageInput } from './inbox.controller';

@Injectable()
export class InboxService {
  constructor(
    private readonly prisma: PrismaService,
    private readonly queues: QueueService,
  ) {}

  async ingest(input: InboundMessageInput) {
    const result = await this.prisma.$transaction(async (tx) => {
      const conversation = await this.resolveConversation(tx, input);
      const message = await tx.message.create({
        data: {
          conversationId: conversation.id,
          externalMessageId: input.externalMessageId,
          text: input.text,
          rawPayload: input.rawPayload as Prisma.InputJsonValue | undefined,
        },
      });

      const draft = await tx.requestDraft.create({
        data: {
          conversationId: conversation.id,
          sourceMessageId: message.id,
          rawText: input.text,
          city: input.city,
          address: input.address,
        },
      });

      return { conversation, message, draft };
    });

    await this.queues.enqueueClassification(result.draft.id);
    return {
      conversationId: result.conversation.id,
      messageId: result.message.id,
      requestDraftId: result.draft.id,
      status: 'queued_for_classification',
    };
  }

  private async resolveConversation(tx: Prisma.TransactionClient, input: InboundMessageInput) {
    if (input.conversationId) {
      const existing = await tx.conversation.findUnique({ where: { id: input.conversationId } });
      if (!existing) throw new NotFoundException('Conversation not found');
      return existing;
    }

    if (input.externalThreadId) {
      const existing = await tx.conversation.findUnique({
        where: {
          channel_externalThreadId: {
            channel: input.channel as unknown as PrismaChannelType,
            externalThreadId: input.externalThreadId,
          },
        },
      });
      if (existing) return existing;
    }

    return tx.conversation.create({
      data: {
        channel: input.channel as unknown as PrismaChannelType,
        externalThreadId: input.externalThreadId,
        customerExternalId: input.customerExternalId,
        customerName: input.customerName,
        customerPhone: input.customerPhone,
      },
    });
  }
}
