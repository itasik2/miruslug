import { Injectable, OnApplicationShutdown } from '@nestjs/common';
import { Queue } from 'bullmq';
import {
  ClassificationJob,
  DistributionJob,
  QUEUE_NAMES,
  redisConnectionFromUrl,
} from '@miruslug/queue';

@Injectable()
export class QueueService implements OnApplicationShutdown {
  private readonly classification: Queue<ClassificationJob>;
  private readonly distribution: Queue<DistributionJob>;

  constructor() {
    const redisUrl = process.env.REDIS_URL || 'redis://127.0.0.1:6379';
    const connection = redisConnectionFromUrl(redisUrl);
    this.classification = new Queue(QUEUE_NAMES.classification, { connection });
    this.distribution = new Queue(QUEUE_NAMES.distribution, { connection });
  }

  enqueueClassification(draftId: string) {
    return this.classification.add('classify-request-draft', { draftId }, {
      jobId: `classify-${draftId}`,
      removeOnComplete: 1000,
      removeOnFail: 5000,
    });
  }

  enqueueDistribution(requestId: string, wave = 0, delay = 0) {
    return this.distribution.add('distribute-request', { requestId, wave }, {
      jobId: `distribute-${requestId}-${wave}`,
      delay,
      removeOnComplete: 1000,
      removeOnFail: 5000,
    });
  }

  async onApplicationShutdown() {
    await Promise.all([this.classification.close(), this.distribution.close()]);
  }
}
