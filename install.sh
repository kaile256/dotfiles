#!/usr/bin/env bash

set -Ceuo pipefail
IFS=$'\n\t'

SCRIPT_DIR=$(readlink -f "$0" | xargs dirname)

"$SCRIPT_DIR/symlink.sh"
"$SCRIPT_DIR/pkgm.sh"
