#!/usr/bin/env bash

set -Ceu

pgrep bluetoothd || exit

bluetoothctl power on

KEYBOARD_NAME='TrackPoint Keyboard'
MAC_KEYBOARD=$(bluetoothctl paired-devices | grep -i "$KEYBOARD_NAME" | awk '{print $2}')
has_disconnected=$(bluetoothctl info "$MAC_KEYBOARD" | grep 'Connected: no' \
  && echo -n 'true')

bluetoothctl connect "$MAC_KEYBOARD"

if $has_disconnected ; then
  notify_msg() {
    msg=$1
    if type notify-send >/dev/null 2>&1; then
      notify-send \
        --expire-time 2000 \
        --urgency=critical \
        "$msg"
    fi
    echo "$msg"
  }

  bluetoothctl info "$MAC_KEYBOARD" && notify_msg "$KEYBOARD_NAME is connected"
fi
