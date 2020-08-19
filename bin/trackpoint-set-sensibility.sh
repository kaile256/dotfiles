#!/usr/bin/env bash

set -Ceu

TRACKPOINT_ID=$(xinput --list --short \
  | grep Keyboard | grep Mouse \
  | cut -d= -f2 | awk '{print $1}')

SENSIBILITY=${1:-0}

if [ "$SENSIBILITY" -lt 0 ]; then
  shopt -s extglob
  TMP=${SENSIBILITY//-/}
  SENSIBILITY="-0.$TMP"
else
  SENSIBILITY="0.$SENSIBILITY"
fi

echo xinput --set-prop "$TRACKPOINT_ID" "libinput Accel Speed" "$SENSIBILITY"
xinput --set-prop "$TRACKPOINT_ID" "libinput Accel Speed" "$SENSIBILITY"
