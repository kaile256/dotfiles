#!/usr/bin/env bash

set -Ceuo pipefail
IFS=$'\n\t'

PID=$(ps -C xkeysnail --no-heading --format pid | tr --delete ' ')

[ -n "$PID" ] && sudo kill "$PID" \
  && echo "xkeysnail is killed at $PID"

