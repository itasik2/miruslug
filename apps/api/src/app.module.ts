import { Module } from '@nestjs/common';
import { HealthController } from './health.controller';
import { PrismaService } from './prisma.service';
import { QueueService } from './queue.service';
import { InboxController } from './inbox.controller';
import { InboxService } from './inbox.service';
import { ProvidersController } from './providers.controller';
import { RequestsController } from './requests.controller';
import { MetaWebhookController } from './meta-webhook.controller';
import { MetaWebhookService } from './meta-webhook.service';

@Module({
  controllers: [
    HealthController,
    InboxController,
    ProvidersController,
    RequestsController,
    MetaWebhookController,
  ],
  providers: [PrismaService, QueueService, InboxService, MetaWebhookService],
})
export class AppModule {}
