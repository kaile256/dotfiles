#!/usr/bin/env bash

# From: i3/config
st_prev="disconnected"

while :
do
  st_next=$(cat /sys/class/drm/card0-HDMI-A-1/status)
  if [ $st_prev != $st_next ]; then
    st_prev=$st_next
    if [ $st_next = "connected" ]; then
      xrandr --output eDP1 --mode 1600x900 --output HDMI1 --auto --above eDP1
    else
      xrandr --output eDP1 --mode 1600x900 --output HDMI1 --off
    fi
    ~/.fehbg
  fi
  sleep 1
done
