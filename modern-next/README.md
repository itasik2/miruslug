# MirUslug Modern

Современная Next.js-версия интерфейса старого сервиса «Мир Услуг».

## Что сохранено

- бренд и оранжево-тёмная визуальная идея;
- выбор города;
- каталог услуг;
- сценарий «оставьте заявку, мы поможем»;
- блок «как это работает»;
- отдельный вход для исполнителей;
- использование оригинальных фоновых изображений MirUslug из этого репозитория.

## Что изменено

- Next.js 16 + React 19 + TypeScript;
- адаптивная мобильная вёрстка;
- быстрый поиск по услугам;
- модальная форма заявки;
- современная структура секций;
- никаких зависимостей от MODX, PHP или MySQL.

Форма заявки подключена к MirUslug 2 backend через same-origin route `POST /api/requests`. Route работает на сервере Next.js и пересылает данные в NestJS `POST /v1/inbox/messages` с каналом `WEB`.

## Локальный запуск

```bash
cd ..
npm install
npm run dev:api
npm run dev:worker
npm run dev:web
```

По умолчанию web proxy ожидает API на:

```text
http://127.0.0.1:4000
```

## Production build

```bash
npm run build
```

## Vercel

При импорте репозитория в Vercel укажите Root Directory:

```text
modern-next
```

Framework Preset: Next.js.

Добавьте server-side environment variable:

```text
MIRUSLUG_API_URL=https://<railway-api-domain>
```

Она не имеет префикса `NEXT_PUBLIC_`, поэтому адрес backend не встраивается в клиентский JavaScript.

## Pipeline заявки

```text
Web form -> Next.js /api/requests -> NestJS Unified Inbox -> Conversation -> Message
         -> RequestDraft -> Classification Worker -> Request -> Distribution Worker
```

WhatsApp Business Cloud API и Instagram Direct используют тот же Unified Inbox через Meta webhook adapters в `apps/api`.
