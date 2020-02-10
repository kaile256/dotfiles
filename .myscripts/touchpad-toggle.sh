#!/usr/bin/env bash

set -Ceu

if xinput list Elan\ Touchpad | grep disabled >/dev/null ; then
  xinput enable Elan\ Touchpad
  notify-send --expire-time 1200 --urgency critical 'TouchPad: Activated'
else
  xinput disable Elan\ Touchpad >/dev/null 2>&1
  notify-send --expire-time 1200 'TouchPad: OFF'
fi

if xinput list Elan\ TrackPoint | grep disabled >/dev/null ; then
  xinput enable Elan\ TrackPoint
  notify-send --expire-time 1200 --urgency critical 'TrackPoint: Activated'
#else
#  xinput disable Elan\ TrackPoint >/dev/null 2>&1
#  notify-send --expire-time 1200 'TrackPoint: OFF'
fi
