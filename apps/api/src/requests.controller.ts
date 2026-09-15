import { BadRequestException, Body, Controller, Get, NotFoundException, Param, Post } from '@nestjs/common';
import { IsInt, IsOptional, IsString, Min } from 'class-validator';
import { PrismaService } from './prisma.service';

class CreateOfferDto {
  @IsString() providerId!: string;
  @IsInt() @Min(1) priceKzt!: number;
  @IsInt() @Min(1) etaMinutes!: number;
  @IsOptional() @IsString() comment?: string;
}

@Controller('v1/requests')
export class RequestsController {
  constructor(private readonly prisma: PrismaService) {}

  @Post(':requestId/offers')
  async createOffer(@Param('requestId') requestId: string, @Body() dto: CreateOfferDto) {
    const distribution = await this.prisma.requestDistribution.findUnique({
      where: { requestId_providerId: { requestId, providerId: dto.providerId } },
    });
    if (!distribution) throw new BadRequestException('Provider was not invited to this request');

    const offer = await this.prisma.offer.upsert({
      where: { requestId_providerId: { requestId, providerId: dto.providerId } },
      update: { priceKzt: dto.priceKzt, etaMinutes: dto.etaMinutes, comment: dto.comment, status: 'SUBMITTED' },
      create: { requestId, providerId: dto.providerId, priceKzt: dto.priceKzt, etaMinutes: dto.etaMinutes, comment: dto.comment },
      include: { provider: true },
    });

    await this.prisma.requestDistribution.update({
      where: { requestId_providerId: { requestId, providerId: dto.providerId } },
      data: { status: 'RESPONDED', respondedAt: new Date() },
    });

    return offer;
  }

  @Get(':requestId/offers')
  listOffers(@Param('requestId') requestId: string) {
    return this.prisma.offer.findMany({
      where: { requestId, status: 'SUBMITTED' },
      include: { provider: true },
      orderBy: { createdAt: 'asc' },
    });
  }

  @Post(':requestId/offers/:offerId/select')
  async selectOffer(@Param('requestId') requestId: string, @Param('offerId') offerId: string) {
    const offer = await this.prisma.offer.findFirst({ where: { id: offerId, requestId } });
    if (!offer) throw new NotFoundException('Offer not found');

    await this.prisma.$transaction([
      this.prisma.offer.updateMany({ where: { requestId, id: { not: offerId } }, data: { status: 'REJECTED' } }),
      this.prisma.offer.update({ where: { id: offerId }, data: { status: 'ACCEPTED' } }),
      this.prisma.request.update({ where: { id: requestId }, data: { status: 'SELECTED' } }),
    ]);

    return this.prisma.offer.findUnique({ where: { id: offerId }, include: { provider: true } });
  }
}
