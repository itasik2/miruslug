#!/usr/bin/env bash
set -euo pipefail

# Reset a MODX Evolution manager account in the LOCAL legacy database.
# Usage:
#   ./bin/reset-admin.sh [username]
# The new password is read interactively and is never written to the repository.

USERNAME="${1:-admin}"

if [[ ! -t 0 ]]; then
  echo "This script must be run from an interactive terminal." >&2
  exit 1
fi

read -r -s -p "New password for MODX manager user '${USERNAME}': " PASSWORD
echo
read -r -s -p "Repeat password: " PASSWORD_CONFIRM
echo

if [[ -z "${PASSWORD}" ]]; then
  echo "Password must not be empty." >&2
  exit 1
fi

if [[ "${PASSWORD}" != "${PASSWORD_CONFIRM}" ]]; then
  echo "Passwords do not match." >&2
  exit 1
fi

if (( ${#PASSWORD} < 10 )); then
  echo "Use at least 10 characters for the local manager password." >&2
  exit 1
fi

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

# Hex literals keep shell-provided values out of SQL quoting entirely.
USERNAME_HEX="$(printf '%s' "${USERNAME}" | od -An -tx1 | tr -d ' \n')"
PASSWORD_HEX="$(printf '%s' "${PASSWORD}" | od -An -tx1 | tr -d ' \n')"

# shellcheck disable=SC2086
$COMPOSE exec -T db mysql \
  -uroot -pmiruslug_root_local miruslug <<SQL
SET @username = CONVERT(0x${USERNAME_HEX} USING utf8);
SET @password = CONVERT(0x${PASSWORD_HEX} USING utf8);

UPDATE srv_manager_users
SET password = MD5(@password)
WHERE username = @username;

UPDATE srv_user_attributes ua
JOIN srv_manager_users mu ON mu.id = ua.internalKey
SET ua.blocked = 0,
    ua.blockeduntil = 0,
    ua.blockedafter = 0,
    ua.failedlogincount = 0,
    ua.sessionid = ''
WHERE mu.username = @username;

SELECT mu.id,
       mu.username,
       ua.fullname,
       ua.role,
       ua.blocked,
       ua.blockeduntil,
       ua.blockedafter,
       ua.failedlogincount
FROM srv_manager_users mu
JOIN srv_user_attributes ua ON ua.internalKey = mu.id
WHERE mu.username = @username;
SQL

unset PASSWORD PASSWORD_CONFIRM PASSWORD_HEX

echo
echo "MODX manager account reset complete."
echo "Open: http://localhost:8080/manager/"
echo "Username: ${USERNAME}"
echo "After the first successful login MODX will upgrade the temporary MD5 password hash to its configured manager hash format."
