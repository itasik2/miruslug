-- CreateEnum
CREATE TYPE "ChannelType" AS ENUM ('WEB', 'WHATSAPP', 'INSTAGRAM');

-- CreateEnum
CREATE TYPE "ConversationStatus" AS ENUM ('OPEN', 'CLOSED');

-- CreateEnum
CREATE TYPE "MessageDirection" AS ENUM ('INBOUND', 'OUTBOUND');

-- CreateEnum
CREATE TYPE "DraftStatus" AS ENUM ('NEW', 'CLASSIFIED', 'PROMOTED', 'REJECTED');

-- CreateEnum
CREATE TYPE "RequestStatus" AS ENUM ('NEW', 'DISTRIBUTING', 'COLLECTING_OFFERS', 'SELECTED', 'CANCELLED', 'COMPLETED');

-- CreateEnum
CREATE TYPE "ProviderStatus" AS ENUM ('ACTIVE', 'PAUSED', 'BLOCKED');

-- CreateEnum
CREATE TYPE "OfferStatus" AS ENUM ('SUBMITTED', 'ACCEPTED', 'REJECTED', 'EXPIRED');

-- CreateEnum
CREATE TYPE "DistributionStatus" AS ENUM ('QUEUED', 'SENT', 'RESPONDED', 'EXPIRED');

-- CreateTable
CREATE TABLE "Conversation" (
    "id" TEXT NOT NULL,
    "channel" "ChannelType" NOT NULL,
    "externalThreadId" TEXT,
    "customerExternalId" TEXT,
    "customerName" TEXT,
    "customerPhone" TEXT,
    "status" "ConversationStatus" NOT NULL DEFAULT 'OPEN',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    CONSTRAINT "Conversation_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Message" (
    "id" TEXT NOT NULL,
    "conversationId" TEXT NOT NULL,
    "externalMessageId" TEXT,
    "direction" "MessageDirection" NOT NULL DEFAULT 'INBOUND',
    "text" TEXT NOT NULL,
    "rawPayload" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "Message_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RequestDraft" (
    "id" TEXT NOT NULL,
    "conversationId" TEXT NOT NULL,
    "sourceMessageId" TEXT NOT NULL,
    "rawText" TEXT NOT NULL,
    "normalizedText" TEXT,
    "city" TEXT,
    "address" TEXT,
    "status" "DraftStatus" NOT NULL DEFAULT 'NEW',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    CONSTRAINT "RequestDraft_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RequestClassification" (
    "id" TEXT NOT NULL,
    "requestDraftId" TEXT NOT NULL,
    "categoryKey" TEXT NOT NULL,
    "serviceKey" TEXT NOT NULL,
    "confidence" DOUBLE PRECISION NOT NULL,
    "matchedKeywords" JSONB,
    "classifier" TEXT NOT NULL DEFAULT 'rules-v1',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "RequestClassification_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Request" (
    "id" TEXT NOT NULL,
    "requestDraftId" TEXT NOT NULL,
    "conversationId" TEXT NOT NULL,
    "categoryKey" TEXT NOT NULL,
    "serviceKey" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "city" TEXT,
    "address" TEXT,
    "urgent" BOOLEAN NOT NULL DEFAULT false,
    "status" "RequestStatus" NOT NULL DEFAULT 'NEW',
    "distributionWave" INTEGER NOT NULL DEFAULT 0,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    CONSTRAINT "Request_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Provider" (
    "id" TEXT NOT NULL,
    "displayName" TEXT NOT NULL,
    "phone" TEXT,
    "whatsappId" TEXT,
    "instagramId" TEXT,
    "status" "ProviderStatus" NOT NULL DEFAULT 'ACTIVE',
    "reliabilityScore" DOUBLE PRECISION NOT NULL DEFAULT 0.5,
    "responseSpeedScore" DOUBLE PRECISION NOT NULL DEFAULT 0.5,
    "jobsCompleted" INTEGER NOT NULL DEFAULT 0,
    "lastSeenAt" TIMESTAMP(3),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    CONSTRAINT "Provider_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ProviderService" (
    "id" TEXT NOT NULL,
    "providerId" TEXT NOT NULL,
    "categoryKey" TEXT NOT NULL,
    "serviceKey" TEXT NOT NULL,
    "enabled" BOOLEAN NOT NULL DEFAULT true,
    "minPriceKzt" INTEGER,
    "maxDistanceKm" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "ProviderService_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RequestDistribution" (
    "id" TEXT NOT NULL,
    "requestId" TEXT NOT NULL,
    "providerId" TEXT NOT NULL,
    "wave" INTEGER NOT NULL,
    "score" DOUBLE PRECISION NOT NULL,
    "status" "DistributionStatus" NOT NULL DEFAULT 'QUEUED',
    "sentAt" TIMESTAMP(3),
    "respondedAt" TIMESTAMP(3),
    "expiresAt" TIMESTAMP(3),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "RequestDistribution_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Offer" (
    "id" TEXT NOT NULL,
    "requestId" TEXT NOT NULL,
    "providerId" TEXT NOT NULL,
    "priceKzt" INTEGER NOT NULL,
    "etaMinutes" INTEGER NOT NULL,
    "comment" TEXT,
    "status" "OfferStatus" NOT NULL DEFAULT 'SUBMITTED',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    CONSTRAINT "Offer_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Conversation_channel_externalThreadId_key" ON "Conversation"("channel", "externalThreadId");
CREATE INDEX "Conversation_channel_createdAt_idx" ON "Conversation"("channel", "createdAt");
CREATE UNIQUE INDEX "Message_conversationId_externalMessageId_key" ON "Message"("conversationId", "externalMessageId");
CREATE INDEX "Message_conversationId_createdAt_idx" ON "Message"("conversationId", "createdAt");
CREATE INDEX "RequestDraft_status_createdAt_idx" ON "RequestDraft"("status", "createdAt");
CREATE UNIQUE INDEX "RequestClassification_requestDraftId_key" ON "RequestClassification"("requestDraftId");
CREATE UNIQUE INDEX "Request_requestDraftId_key" ON "Request"("requestDraftId");
CREATE INDEX "Request_status_createdAt_idx" ON "Request"("status", "createdAt");
CREATE INDEX "Request_categoryKey_serviceKey_idx" ON "Request"("categoryKey", "serviceKey");
CREATE INDEX "Provider_status_idx" ON "Provider"("status");
CREATE UNIQUE INDEX "ProviderService_providerId_serviceKey_key" ON "ProviderService"("providerId", "serviceKey");
CREATE INDEX "ProviderService_serviceKey_enabled_idx" ON "ProviderService"("serviceKey", "enabled");
CREATE INDEX "ProviderService_categoryKey_enabled_idx" ON "ProviderService"("categoryKey", "enabled");
CREATE UNIQUE INDEX "RequestDistribution_requestId_providerId_key" ON "RequestDistribution"("requestId", "providerId");
CREATE INDEX "RequestDistribution_requestId_wave_idx" ON "RequestDistribution"("requestId", "wave");
CREATE UNIQUE INDEX "Offer_requestId_providerId_key" ON "Offer"("requestId", "providerId");
CREATE INDEX "Offer_requestId_status_createdAt_idx" ON "Offer"("requestId", "status", "createdAt");

-- AddForeignKey
ALTER TABLE "Message" ADD CONSTRAINT "Message_conversationId_fkey" FOREIGN KEY ("conversationId") REFERENCES "Conversation"("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "RequestDraft" ADD CONSTRAINT "RequestDraft_conversationId_fkey" FOREIGN KEY ("conversationId") REFERENCES "Conversation"("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "RequestDraft" ADD CONSTRAINT "RequestDraft_sourceMessageId_fkey" FOREIGN KEY ("sourceMessageId") REFERENCES "Message"("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "RequestClassification" ADD CONSTRAINT "RequestClassification_requestDraftId_fkey" FOREIGN KEY ("requestDraftId") REFERENCES "RequestDraft"("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "Request" ADD CONSTRAINT "Request_requestDraftId_fkey" FOREIGN KEY ("requestDraftId") REFERENCES "RequestDraft"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE "Request" ADD CONSTRAINT "Request_conversationId_fkey" FOREIGN KEY ("conversationId") REFERENCES "Conversation"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE "ProviderService" ADD CONSTRAINT "ProviderService_providerId_fkey" FOREIGN KEY ("providerId") REFERENCES "Provider"("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "RequestDistribution" ADD CONSTRAINT "RequestDistribution_requestId_fkey" FOREIGN KEY ("requestId") REFERENCES "Request"("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "RequestDistribution" ADD CONSTRAINT "RequestDistribution_providerId_fkey" FOREIGN KEY ("providerId") REFERENCES "Provider"("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "Offer" ADD CONSTRAINT "Offer_requestId_fkey" FOREIGN KEY ("requestId") REFERENCES "Request"("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "Offer" ADD CONSTRAINT "Offer_providerId_fkey" FOREIGN KEY ("providerId") REFERENCES "Provider"("id") ON DELETE CASCADE ON UPDATE CASCADE;
