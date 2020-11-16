#!/usr/bin/env bash

set -Ceu

pgrep bluetoothd >/dev/null 2>&1 || sudo bluetooth on

bluetoothctl power on

DEVICE=${DEVICE:-'Ponsinc-S4'}
MAC_DEVICE=$(bluetoothctl paired-devices \
  | grep -i "$DEVICE" \
  | awk '{print $2}')

notify_msg() {
  msg=$1
  echo "$msg"
  type notify-send >/dev/null 2>&1 || exit

  notify-send \
    --expire-time 2000 \
    --urgency=critical \
    "$msg"
}

disconnect_device() {
  bluetoothctl disconnect "$MAC_DEVICE"
}

reconnect_device() {
  # TODO: when "Missing device address argument" returns,
  # scan on, pair on, etc. and get a MAC address to connect.
  has_disconnected=$(bluetoothctl info "$MAC_DEVICE" \
    | (grep 'Connected: no' && echo -n 'true') || echo -n 'false')

  disconnect_device
  bluetoothctl connect "$MAC_DEVICE"

  if $has_disconnected ; then
  bluetoothctl info "$MAC_DEVICE" \
    && notify_msg "$DEVICE is connected"
  fi
}

set +u
case "$1" in
  --disconnect)
    disconnect_device
    notify_msg "$DEVICE is disconnected"
    ;;
  --reconnect)
    reconnect_device
    ;;
  *)
    reconnect_device
    ;;
esac

