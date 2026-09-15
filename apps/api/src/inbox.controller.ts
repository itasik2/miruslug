import { Body, Controller, Post } from '@nestjs/common';
import { IsEnum, IsObject, IsOptional, IsString, MaxLength, MinLength } from 'class-validator';
import { ChannelType } from '@miruslug/core';
import { InboxService } from './inbox.service';

class InboundMessageDto {
  @IsEnum(ChannelType)
  channel!: ChannelType;

  @IsString()
  @MinLength(2)
  @MaxLength(5000)
  text!: string;

  @IsOptional() @IsString() conversationId?: string;
  @IsOptional() @IsString() externalThreadId?: string;
  @IsOptional() @IsString() externalMessageId?: string;
  @IsOptional() @IsString() customerExternalId?: string;
  @IsOptional() @IsString() customerName?: string;
  @IsOptional() @IsString() customerPhone?: string;
  @IsOptional() @IsString() city?: string;
  @IsOptional() @IsString() address?: string;
  @IsOptional() @IsObject() rawPayload?: Record<string, unknown>;
}

@Controller('v1/inbox')
export class InboxController {
  constructor(private readonly inbox: InboxService) {}

  @Post('messages')
  createMessage(@Body() dto: InboundMessageDto) {
    return this.inbox.ingest(dto);
  }
}

export type InboundMessageInput = InboundMessageDto;
