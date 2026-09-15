import 'reflect-metadata';
import { ValidationPipe } from '@nestjs/common';
import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';

async function bootstrap() {
  const app = await NestFactory.create(AppModule, { rawBody: true });
  app.enableShutdownHooks();
  app.useGlobalPipes(new ValidationPipe({ whitelist: true, transform: true }));

  const corsOrigin = process.env.CORS_ORIGIN;
  app.enableCors({ origin: corsOrigin ? corsOrigin.split(',').map((value) => value.trim()) : true });

  const port = Number(process.env.PORT || 4000);
  await app.listen(port, '0.0.0.0');
}

void bootstrap();
