#!/usr/bin/env bash

set -Ceu

DEVICE=${DEVICE:-'Ponsinc-S4'}

notify_msg() {
  msg=$1
  echo "$msg"
  type notify-send >/dev/null 2>&1 || exit

  notify-send \
    --expire-time 2000 \
    --urgency=critical \
    "$msg"
}

reconnect_device() {
  bluetoothctl power on

  MAC_DEVICE=$(bluetoothctl paired-devices \
    | grep -i "$DEVICE" \
    | awk '{print $2}')

  # TODO: when "Missing device address argument" returns,
  # scan on, pair on, etc. and get a MAC address to connect.
  has_disconnected=$(bluetoothctl info "$MAC_DEVICE" \
    | (grep 'Connected: no' && echo -n 'true') || echo -n 'false')

  bluetoothctl disconnect "$MAC_DEVICE"
  bluetoothctl connect "$MAC_DEVICE"

  if $has_disconnected ; then
  bluetoothctl info "$MAC_DEVICE" \
    && notify_msg "$DEVICE is connected"
  fi
}

set +u
case "$1" in
  --simple)
    pgrep bluetoothd >/dev/null 2>&1 || exit
    reconnect_device
    ;;
  *)
    pgrep bluetoothd >/dev/null 2>&1 || sudo bluetooth on
    reconnect_device
    ;;
esac

