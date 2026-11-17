#!/usr/bin/env bash

url="${1:-http://127.0.0.1:8000/health}"
if curl --fail --silent --show-error --max-time 5 "$url" > /dev/null; then
  echo "OK: $url"
  exit 0
else
  code=$?
  echo "FAIL: $url (curl=$code)" >&2
  exit "$code"
fi
