#!/usr/bin/env bash

set -Ceu

notify_msg() {
  msg=$1
  echo "$msg"
  type notify-send >/dev/null 2>&1 || exit

  notify-send \
    --expire-time 2000 \
    --urgency=critical \
    "$msg"
}

pgrep bluetoothd >/dev/null 2>&1 || \
  (notify_msg "bluetoothd is not running" && sudo bluetooth on)

bluetoothctl power on
set +u
case "$DEVICE" in
  HHKB)
    DEVICE='RK-Bluetooth keyboard'
    ;;
  RK61)
    DEVICE='RK-Bluetooth keyboard'
    ;;
  TrackPoint)
    DEVICE='TrackPoint Keyboard II'
    ;;
  Mouse)
    DEVICE='bluetooth mouse4.0'
    ;;
  Earphones)
    DEVICE='Ponsinc-S4'
    ;;
  *)
    DEVICE=${DEVICE:-'Ponsinc-S4'}
    ;;
esac
set -u

MAC_DEVICE=$(bluetoothctl paired-devices \
  | grep -i "$DEVICE" \
  | awk '{print $2}')

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

