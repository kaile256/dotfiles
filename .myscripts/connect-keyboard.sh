#!/usr/bin/env bash

set -Ceu

pgrep bluetoothd || exit

KEYBOARD_NAME='TrackPoint Keyboard'
MAC_KEYBOARD=$(bluetoothctl paired-devices | grep -i "$KEYBOARD_NAME" | awk '{print $2}')

bluetoothctl power on
bluetoothctl connect "$MAC_KEYBOARD"
