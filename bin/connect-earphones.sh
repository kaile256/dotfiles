#!/usr/bin/env bash

set -Ceu

EARPHONES_NAME='Ponsinc-S4'

notify_msg() {
  msg=$1
  echo "$msg"
  type notify-send >/dev/null 2>&1 || exit

  notify-send \
    --expire-time 2000 \
    --urgency=critical \
    "$msg"
}

connect_earphones() {
  bluetoothctl power on

  MAC_EARPHONES=$(bluetoothctl paired-devices \
    | grep -i "$EARPHONES_NAME" \
    | awk '{print $2}')

  has_disconnected=$(bluetoothctl info "$MAC_EARPHONES" \
    | grep 'Connected: no' \
    && echo -n 'true')

  bluetoothctl connect "$MAC_EARPHONES"

  if $has_disconnected ; then
  bluetoothctl info "$MAC_EARPHONES" \
    && notify_msg "$EARPHONES_NAME is connected"
  fi
}

set +u
case "$1" in
  --simple)
    pgrep bluetoothd >/dev/null 2>&1 || exit
    connect_earphones
    ;;
  *)
    pgrep bluetoothd >/dev/null 2>&1 || sudo bluetooth on
    connect_earphones
    ;;
esac
