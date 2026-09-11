# Локальный запуск «Мир Услуг»

Этот каталог поднимает архивную версию сайта «Мир Услуг» в изолированном Docker-окружении без изменения оригинальных файлов сайта.

## Что запускается

- Apache + PHP 5.6
- MODX Evolution 1.0.15 из `sources/miruslug`
- MySQL 5.7
- автоматический импорт `sources/itasi178_servdb.sql`

Веб-сервис привязан только к `127.0.0.1`, поэтому по умолчанию он недоступен из внешней сети.

## Требования

Нужны Docker Engine и Docker Compose v2.

Проверка:

```bash
docker --version
docker compose version
```

## Запуск

Из корня репозитория:

```bash
cd legacy-docker
docker compose up -d --build
```

Первый запуск может занять несколько минут: MySQL создаёт базу и импортирует старый SQL-дамп.

Проверить состояние:

```bash
docker compose ps
docker compose logs -f web
```

Сайт:

```text
http://localhost:8080
```

Старая панель MODX:

```text
http://localhost:8080/manager/
```

Панель управления не требуется для просмотра восстановленного сайта. Старые пароли и реквизиты из архивных файлов намеренно не используются Docker-конфигурацией.

## Остановка

```bash
docker compose down
```

## Полный сброс базы и повторный импорт

```bash
docker compose down -v
docker compose up -d --build
```

Важно: `down -v` удалит локальный Docker volume базы. Исходный SQL-файл в репозитории не изменяется.

## Если сайт показывает ошибку

Посмотреть логи:

```bash
docker compose logs --tail=200 web
docker compose logs --tail=200 db
```

Проверить, что MySQL готов:

```bash
docker compose ps
```

Для старого MODX используются расширения PHP `mysql`, `mysqli` и `pdo_mysql`, а Apache запускается с `mod_rewrite` и `AllowOverride All`, поскольку оригинальный `.htaccess` использует Friendly URLs.

## Безопасность

Это архивное приложение 2015 года на неподдерживаемом стеке. Не публикуйте контейнер напрямую в интернет. Конфигурация специально использует привязку:

```text
127.0.0.1:8080:80
```

Для публичной демонстрации сначала ставьте перед ним современный reverse proxy и ограничение доступа.
