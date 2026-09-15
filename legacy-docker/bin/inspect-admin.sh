#!/usr/bin/env bash
set -euo pipefail

find_compose() {
  if command -v docker >/dev/null 2>&1 && docker compose version >/dev/null 2>&1; then
    echo "docker compose"
    return
  fi
  if command -v podman >/dev/null 2>&1 && podman compose version >/dev/null 2>&1; then
    echo "podman compose"
    return
  fi
  if command -v podman-compose >/dev/null 2>&1; then
    echo "podman-compose"
    return
  fi
  echo "Neither 'docker compose', 'podman compose' nor 'podman-compose' is available." >&2
  exit 1
}

COMPOSE="$(find_compose)"
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
LEGACY_DIR="$(cd -- "${SCRIPT_DIR}/.." && pwd)"
cd "${LEGACY_DIR}"

echo "== Containers =="
# shellcheck disable=SC2086
$COMPOSE ps

echo
echo "== MODX manager users =="
# shellcheck disable=SC2086
$COMPOSE exec -T db mysql -N -uroot -pmiruslug_root_local miruslug -e "
SELECT CONCAT(
  'id=', mu.id,
  ' username=', mu.username,
  ' role=', ua.role,
  ' blocked=', ua.blocked,
  ' failed=', ua.failedlogincount
)
FROM srv_manager_users mu
JOIN srv_user_attributes ua ON ua.internalKey = mu.id
ORDER BY mu.id;"

echo
echo "== MODX manager modules =="
# shellcheck disable=SC2086
$COMPOSE exec -T db mysql -N -uroot -pmiruslug_root_local miruslug -e "
SELECT CONCAT(id, ' | ', name, ' | disabled=', disabled)
FROM srv_site_modules
ORDER BY id;"

echo
echo "== MirUslug cities =="
# shellcheck disable=SC2086
$COMPOSE exec -T db mysql -N -uroot -pmiruslug_root_local miruslug -e "
SELECT CONCAT(id, ' | ', city, ' | ', COALESCE(phone,''), ' | ', COALESCE(email,''))
FROM srv_manager_CITY_INFO
ORDER BY id;"

echo
echo "== Forms and service plumbing =="
# shellcheck disable=SC2086
$COMPOSE exec -T db mysql -N -uroot -pmiruslug_root_local miruslug -e "
SELECT CONCAT('snippet | ', id, ' | ', name)
FROM srv_site_snippets
WHERE name IN ('eForm','city_info','Ditto')
UNION ALL
SELECT CONCAT('chunk | ', id, ' | ', name)
FROM srv_site_htmlsnippets
WHERE name LIKE 'OrderForm%' OR name LIKE '%FormReport%' OR name LIKE 'ContactForm%';"

echo
echo "== Content summary =="
# shellcheck disable=SC2086
$COMPOSE exec -T db mysql -N -uroot -pmiruslug_root_local miruslug -e "
SELECT CONCAT(
  'documents=', COUNT(*),
  ' published=', SUM(CASE WHEN published=1 AND deleted=0 THEN 1 ELSE 0 END),
  ' deleted=', SUM(CASE WHEN deleted=1 THEN 1 ELSE 0 END)
)
FROM srv_site_content;"

echo
echo "Manager URL: http://localhost:8080/manager/"
