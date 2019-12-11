#!/usr/bin/env bash

if xinput list Elan\ Touchpad | grep disabled >/dev/null ; then
  xinput enable Elan\ Touchpad
  notify-send --expire-time 1200 'touchpad is now available'
else
  xinput disable Elan\ Touchpad >/dev/null
  notify-send --expire-time 1200 --urgency critical 'touchpad is disabled'
fi
