# MirUslug 2.0 architecture

## Repository layout

The legacy MODX application stays untouched. New development is isolated in these paths:

```text
modern-next/             # Next.js 16 web app, deployed to Vercel
apps/
  api/                   # NestJS HTTP API, deployed to Railway
  worker/                # BullMQ workers, deployed to Railway separately
packages/
  core/                  # domain rules, classification and provider scoring
  database/              # Prisma schema/client for Neon PostgreSQL
  queue/                 # queue names, Redis connection and job contracts
docs/architecture/       # architecture decisions
```

`modern-next` intentionally keeps its existing directory name so the current Vercel Root Directory does not change.

## Unified intake pipeline

All inbound channels are peers. Channel-specific adapters only normalize external payloads and then enter one pipeline:

```text
WEB ─────────┐
WHATSAPP ────┼─> Unified Inbox -> Conversation -> Message -> RequestDraft
INSTAGRAM ───┘                                      |
                                                    v
                                             Classification Worker
                                                    |
                                                    v
                                                 Request
                                                    |
                                                    v
                                             Distribution Worker
                                                    |
                                                    v
                                         Provider waves -> Offers
                                                    |
                                                    v
                                             Customer selects
```

The database stores the source channel on each conversation. External WhatsApp and Instagram webhook adapters should never contain business logic; they only validate Meta signatures, deduplicate external message IDs and call the same inbox service used by the web channel.

## MVP distribution rules

Providers may have any number of `ProviderService` rows. A request matches providers by service first and category second. Eligible providers are ranked using:

- reliability score: 55%;
- response-speed score: 45%.

Distribution happens in waves of 5, 10 and 20 providers. Later waves are delayed and can stop once offers arrive. Each `(request, provider)` distribution is unique, so retries do not spam the same provider.

## MVP HTTP surface

- `GET /health`
- `POST /v1/inbox/messages` - normalized inbound message from WEB/WHATSAPP/INSTAGRAM
- `POST /v1/providers` - create a multi-profile provider
- `POST /v1/requests/:requestId/offers` - provider response with price and ETA
- `GET /v1/requests/:requestId/offers` - offers for customer selection
- `POST /v1/requests/:requestId/offers/:offerId/select` - accept one offer

## Deployment boundaries

- Vercel: `modern-next`
- Railway service 1: `apps/api`
- Railway service 2: `apps/worker`
- Neon: PostgreSQL via `DATABASE_URL`
- Railway Redis or another Redis provider: BullMQ via `REDIS_URL`

The API and worker share code only through workspace packages. They do not call each other synchronously for classification or distribution.
