#!/usr/bin/env bash

set -Ceu

SCRIPT_DIR=$(readlink -f "$0" | xargs dirname)
DEVICE='RK-Bluetooth keyboard' "$SCRIPT_DIR/bluetooth-connect.sh"
