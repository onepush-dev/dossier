#!/bin/sh
# Railway volumes mount root-owned: fix /data, then run Dossier as the node user.
set -eu
if [ "$(id -u)" = "0" ]; then
  mkdir -p "${DOSSIER_DATA_DIR:-/data}"
  chown -R node:node "${DOSSIER_DATA_DIR:-/data}" /app/.next/cache 2>/dev/null || true
  exec gosu node "$0" "$@"
fi
if [ -z "${DOSSIER_PASSWORD:-}" ]; then
  if [ -z "${DOSSIER_LOGIN_PASSWORD:-}" ]; then
    echo "Set DOSSIER_LOGIN_PASSWORD (plain) or DOSSIER_PASSWORD (hash)." >&2; exit 1
  fi
  DOSSIER_PASSWORD="$(printf '%s\n' "$DOSSIER_LOGIN_PASSWORD" | hash-password 2>/dev/null)"
  export DOSSIER_PASSWORD
  echo "Dossier: sign-in password taken from DOSSIER_LOGIN_PASSWORD (hashed at start)."
fi
cd /app
exec ./start.sh
