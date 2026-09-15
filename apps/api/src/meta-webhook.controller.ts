import { Body, Controller, Get, Headers, HttpCode, Post, Query, Req } from '@nestjs/common';
import { MetaWebhookService } from './meta-webhook.service';

@Controller('v1/webhooks/meta')
export class MetaWebhookController {
  constructor(private readonly webhooks: MetaWebhookService) {}

  @Get('whatsapp')
  verifyWhatsApp(
    @Query('hub.mode') mode?: string,
    @Query('hub.verify_token') token?: string,
    @Query('hub.challenge') challenge?: string,
  ) {
    return this.webhooks.verify(mode, token, challenge);
  }

  @Post('whatsapp')
  @HttpCode(200)
  async receiveWhatsApp(
    @Body() payload: unknown,
    @Req() request: { rawBody?: Buffer },
    @Headers('x-hub-signature-256') signature?: string,
  ) {
    this.webhooks.assertSignature(request.rawBody, signature);
    const processed = await this.webhooks.ingestWhatsApp(payload);
    return { received: true, processed };
  }

  @Get('instagram')
  verifyInstagram(
    @Query('hub.mode') mode?: string,
    @Query('hub.verify_token') token?: string,
    @Query('hub.challenge') challenge?: string,
  ) {
    return this.webhooks.verify(mode, token, challenge);
  }

  @Post('instagram')
  @HttpCode(200)
  async receiveInstagram(
    @Body() payload: unknown,
    @Req() request: { rawBody?: Buffer },
    @Headers('x-hub-signature-256') signature?: string,
  ) {
    this.webhooks.assertSignature(request.rawBody, signature);
    const processed = await this.webhooks.ingestInstagram(payload);
    return { received: true, processed };
  }
}
