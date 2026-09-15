import { Body, Controller, Post } from '@nestjs/common';
import { Type } from 'class-transformer';
import { IsArray, IsInt, IsOptional, IsString, Max, Min, ValidateNested } from 'class-validator';
import { PrismaService } from './prisma.service';

class ProviderServiceDto {
  @IsString() categoryKey!: string;
  @IsString() serviceKey!: string;
  @IsOptional() @IsInt() @Min(0) minPriceKzt?: number;
  @IsOptional() @IsInt() @Min(1) @Max(500) maxDistanceKm?: number;
}

class CreateProviderDto {
  @IsString() displayName!: string;
  @IsOptional() @IsString() phone?: string;
  @IsOptional() @IsString() whatsappId?: string;
  @IsOptional() @IsString() instagramId?: string;

  @IsArray()
  @ValidateNested({ each: true })
  @Type(() => ProviderServiceDto)
  services!: ProviderServiceDto[];
}

@Controller('v1/providers')
export class ProvidersController {
  constructor(private readonly prisma: PrismaService) {}

  @Post()
  create(@Body() dto: CreateProviderDto) {
    return this.prisma.provider.create({
      data: {
        displayName: dto.displayName,
        phone: dto.phone,
        whatsappId: dto.whatsappId,
        instagramId: dto.instagramId,
        services: { create: dto.services },
      },
      include: { services: true },
    });
  }
}
