#!/usr/bin/env bash

set -Ceu

SCRIPT_DIR=$(readlink -f "$0" | xargs dirname)
DEVICE='TrackPoint Keyboard II' "$SCRIPT_DIR/bluetooth-connect.sh"
