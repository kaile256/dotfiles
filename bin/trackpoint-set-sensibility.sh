#!/usr/bin/env bash

set -Ceu

TRACKPOINTS=$(xinput --list --short \
  | grep TrackPoint)
COUNT_CANDIDATES=$(echo "$TRACKPOINTS" | wc --lines)
if [ "$COUNT_CANDIDATES" -gt 1 ]; then
  TRACKPOINTS=$(echo "$TRACKPOINTS" | grep Mouse)
fi
TRACKPOINT_ID=$(echo "$TRACKPOINTS" | cut -d= -f2 | awk '{print $1}')

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
