#!/usr/bin/env bash

# TODO: find where the error happened to stop this script with `set -e`.
set -Cuo pipefail
IFS=$'\n\t'

SCRIPT_DIR=$(readlink -f "$0" | xargs dirname)

"$SCRIPT_DIR/stop.sh"
"$SCRIPT_DIR/start.sh"

