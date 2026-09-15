import { Queue, Worker } from 'bullmq';
import {
  classifyRequestText,
  DISTRIBUTION_WAVE_DELAYS_MS,
  DISTRIBUTION_WAVE_SIZES,
  providerMatchScore,
} from '@miruslug/core';
import { PrismaClient } from '@miruslug/database';
import {
  ClassificationJob,
  DistributionJob,
  QUEUE_NAMES,
  redisConnectionFromUrl,
} from '@miruslug/queue';

const prisma = new PrismaClient();
const connection = redisConnectionFromUrl(process.env.REDIS_URL || 'redis://127.0.0.1:6379');
const distributionQueue = new Queue<DistributionJob>(QUEUE_NAMES.distribution, { connection });

const classificationWorker = new Worker<ClassificationJob>(
  QUEUE_NAMES.classification,
  async (job) => {
    const draft = await prisma.requestDraft.findUnique({ where: { id: job.data.draftId } });
    if (!draft) return;

    const classification = classifyRequestText(draft.rawText);
    await prisma.requestClassification.upsert({
      where: { requestDraftId: draft.id },
      update: {
        categoryKey: classification.categoryKey,
        serviceKey: classification.serviceKey,
        confidence: classification.confidence,
        matchedKeywords: classification.matchedKeywords,
      },
      create: {
        requestDraftId: draft.id,
        categoryKey: classification.categoryKey,
        serviceKey: classification.serviceKey,
        confidence: classification.confidence,
        matchedKeywords: classification.matchedKeywords,
      },
    });

    const request = await prisma.request.upsert({
      where: { requestDraftId: draft.id },
      update: {
        categoryKey: classification.categoryKey,
        serviceKey: classification.serviceKey,
        status: 'DISTRIBUTING',
      },
      create: {
        requestDraftId: draft.id,
        conversationId: draft.conversationId,
        categoryKey: classification.categoryKey,
        serviceKey: classification.serviceKey,
        title: draft.rawText.slice(0, 120),
        description: draft.rawText,
        city: draft.city,
        address: draft.address,
        status: 'DISTRIBUTING',
      },
    });

    await prisma.requestDraft.update({ where: { id: draft.id }, data: { status: 'PROMOTED' } });
    await distributionQueue.add('distribute-request', { requestId: request.id, wave: 0 }, {
      jobId: `distribute:${request.id}:0`,
      removeOnComplete: 1000,
      removeOnFail: 5000,
    });
  },
  { connection, concurrency: 10 },
);

const distributionWorker = new Worker<DistributionJob>(
  QUEUE_NAMES.distribution,
  async (job) => {
    const { requestId, wave } = job.data;
    if (wave >= DISTRIBUTION_WAVE_SIZES.length) return;

    const request = await prisma.request.findUnique({
      where: { id: requestId },
      include: { offers: { where: { status: 'SUBMITTED' }, select: { id: true } } },
    });
    if (!request || request.status === 'SELECTED' || request.status === 'CANCELLED' || request.offers.length > 0) return;

    const alreadyDistributed = await prisma.requestDistribution.findMany({
      where: { requestId },
      select: { providerId: true },
    });
    const excludedIds = alreadyDistributed.map((item) => item.providerId);

    const providers = await prisma.provider.findMany({
      where: {
        status: 'ACTIVE',
        id: excludedIds.length ? { notIn: excludedIds } : undefined,
        services: {
          some: {
            enabled: true,
            OR: [
              { serviceKey: request.serviceKey },
              { categoryKey: request.categoryKey },
            ],
          },
        },
      },
      select: {
        id: true,
        reliabilityScore: true,
        responseSpeedScore: true,
      },
      take: 100,
    });

    const ranked = providers
      .map((provider) => ({
        ...provider,
        score: providerMatchScore(provider.reliabilityScore, provider.responseSpeedScore),
      }))
      .sort((a, b) => b.score - a.score)
      .slice(0, DISTRIBUTION_WAVE_SIZES[wave]);

    if (ranked.length > 0) {
      await prisma.$transaction(
        ranked.map((provider) => prisma.requestDistribution.create({
          data: {
            requestId,
            providerId: provider.id,
            wave,
            score: provider.score,
            status: 'SENT',
            sentAt: new Date(),
          },
        })),
      );

      await prisma.request.update({
        where: { id: requestId },
        data: { status: 'COLLECTING_OFFERS', distributionWave: wave },
      });
    }

    if (wave < DISTRIBUTION_WAVE_SIZES.length - 1) {
      const delay = DISTRIBUTION_WAVE_DELAYS_MS[wave] ?? 180_000;
      await distributionQueue.add('distribute-request', { requestId, wave: wave + 1 }, {
        jobId: `distribute:${requestId}:${wave + 1}`,
        delay,
        removeOnComplete: 1000,
        removeOnFail: 5000,
      });
    }
  },
  { connection, concurrency: 5 },
);

for (const worker of [classificationWorker, distributionWorker]) {
  worker.on('failed', (job, error) => {
    console.error(`[${worker.name}] job ${job?.id ?? 'unknown'} failed`, error);
  });
}

async function shutdown() {
  await Promise.all([classificationWorker.close(), distributionWorker.close(), distributionQueue.close()]);
  await prisma.$disconnect();
}

process.on('SIGTERM', () => void shutdown());
process.on('SIGINT', () => void shutdown());

console.log('MirUslug worker started');
