import { BadRequestException, ForbiddenException, Injectable } from '@nestjs/common';
import { createHmac, timingSafeEqual } from 'node:crypto';
import { ChannelType } from '@miruslug/core';
import { InboxService } from './inbox.service';

type JsonRecord = Record<string, unknown>;

type NormalizedInbound = {
  channel: ChannelType;
  text: string;
  externalThreadId?: string;
  externalMessageId?: string;
  customerExternalId?: string;
  customerName?: string;
  customerPhone?: string;
  rawPayload: JsonRecord;
};

@Injectable()
export class MetaWebhookService {
  constructor(private readonly inbox: InboxService) {}

  verify(mode?: string, token?: string, challenge?: string) {
    const expected = process.env.META_VERIFY_TOKEN;
    if (!expected) throw new ForbiddenException('META_VERIFY_TOKEN is not configured');
    if (mode !== 'subscribe' || token !== expected || !challenge) {
      throw new ForbiddenException('Webhook verification failed');
    }
    return challenge;
  }

  assertSignature(rawBody: Buffer | undefined, signatureHeader: string | string[] | undefined) {
    const secret = process.env.META_APP_SECRET;
    if (!secret) return;
    if (!rawBody) throw new BadRequestException('Raw request body is unavailable');

    const signature = Array.isArray(signatureHeader) ? signatureHeader[0] : signatureHeader;
    if (!signature?.startsWith('sha256=')) throw new ForbiddenException('Missing Meta signature');

    const expected = `sha256=${createHmac('sha256', secret).update(rawBody).digest('hex')}`;
    const actualBuffer = Buffer.from(signature);
    const expectedBuffer = Buffer.from(expected);
    if (actualBuffer.length !== expectedBuffer.length || !timingSafeEqual(actualBuffer, expectedBuffer)) {
      throw new ForbiddenException('Invalid Meta signature');
    }
  }

  async ingestWhatsApp(payload: unknown) {
    const messages = this.normalizeWhatsApp(payload);
    await Promise.all(messages.map((message) => this.inbox.ingest(message)));
    return messages.length;
  }

  async ingestInstagram(payload: unknown) {
    const messages = this.normalizeInstagram(payload);
    await Promise.all(messages.map((message) => this.inbox.ingest(message)));
    return messages.length;
  }

  private normalizeWhatsApp(payload: unknown): NormalizedInbound[] {
    const root = asRecord(payload);
    const entries = asArray(root.entry);
    const normalized: NormalizedInbound[] = [];

    for (const entryValue of entries) {
      const entry = asRecord(entryValue);
      for (const changeValue of asArray(entry.changes)) {
        const change = asRecord(changeValue);
        const value = asRecord(change.value);
        const contacts = asArray(value.contacts);
        const firstContact = asRecord(contacts[0]);
        const profile = asRecord(firstContact.profile);
        const contactName = asString(profile.name);

        for (const messageValue of asArray(value.messages)) {
          const message = asRecord(messageValue);
          const from = asString(message.from);
          const messageId = asString(message.id);
          const text = extractWhatsAppText(message);
          if (!from || !messageId || !text) continue;

          normalized.push({
            channel: ChannelType.WHATSAPP,
            text,
            externalThreadId: from,
            externalMessageId: messageId,
            customerExternalId: from,
            customerPhone: from,
            customerName: contactName,
            rawPayload: root,
          });
        }
      }
    }

    return normalized;
  }

  private normalizeInstagram(payload: unknown): NormalizedInbound[] {
    const root = asRecord(payload);
    const entries = asArray(root.entry);
    const normalized: NormalizedInbound[] = [];

    for (const entryValue of entries) {
      const entry = asRecord(entryValue);
      for (const eventValue of asArray(entry.messaging)) {
        const event = asRecord(eventValue);
        const sender = asRecord(event.sender);
        const message = asRecord(event.message);
        const senderId = asString(sender.id);
        const messageId = asString(message.mid);
        const text = asString(message.text);
        if (!senderId || !messageId || !text) continue;

        normalized.push({
          channel: ChannelType.INSTAGRAM,
          text,
          externalThreadId: senderId,
          externalMessageId: messageId,
          customerExternalId: senderId,
          rawPayload: root,
        });
      }
    }

    return normalized;
  }
}

function extractWhatsAppText(message: JsonRecord) {
  const text = asString(asRecord(message.text).body);
  if (text) return text;

  const button = asString(asRecord(message.button).text);
  if (button) return button;

  const interactive = asRecord(message.interactive);
  const buttonReply = asString(asRecord(interactive.button_reply).title);
  if (buttonReply) return buttonReply;

  return asString(asRecord(interactive.list_reply).title);
}

function asRecord(value: unknown): JsonRecord {
  return value && typeof value === 'object' && !Array.isArray(value) ? value as JsonRecord : {};
}

function asArray(value: unknown): unknown[] {
  return Array.isArray(value) ? value : [];
}

function asString(value: unknown): string | undefined {
  return typeof value === 'string' && value.trim() ? value.trim() : undefined;
}
