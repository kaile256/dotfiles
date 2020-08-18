#!/usr/bin/env bash

set -Ceu

SCRIPT_DIR=$(readlink -f "$0" | xargs dirname)
DEVICE='bluetooth mouse4.0' "$SCRIPT_DIR/bluetooth-connect.sh"
