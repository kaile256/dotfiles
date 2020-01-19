#!/usr/bin/env bash

# From: i3/config
set -Ceu

off=$(xrandr --query | grep " disconnected" | cut -d" " -f1)
for m in $off; do
  xrandr --output "$m" --off
done

#on=$(xrandr --query | grep " connected" | cut -d" " -f1 | grep HDMI)
if monitor=$(xrandr --query | grep " connected" | cut -d" " -f1 | grep HDMI); then
  xrandr --output eDP1 --auto
  xrandr --output "$monitor" --brightness 0.8 --auto --above eDP1
  xbacklight -set 5
else
  xrandr --output eDP1 --auto
  #xbacklight -set 25
fi

#st_prev="disconnected"
#st_next=$(cat /sys/class/drm/card0-HDMI-A-1/status)
#if [ $st_prev != $st_next ]; then
#    st_prev=$st_next
#    if [ $st_next = "connected" ]; then
#        xrandr --output eDP1 --mode 1600x900 --output HDMI1 --auto --above eDP1
#    else
#        xrandr --output eDP1 --mode 1600x900 --output HDMI1 --off
#    fi
#    ~/.fehbg
#fi
#
#st_next=$(cat /sys/class/drm/card0-HDMI-A-2/status)
#if [ $st_prev != $st_next ]; then
#    st_prev=$st_next
#    if [ $st_next = "connected" ]; then
#        xrandr --output eDP1 --auto --output HDMI2 --auto --above eDP1
#    else
#        xrandr --output eDP1 --mode 1600x900 --output HDMI2 --off
#    fi
#    ~/.fehbg
#  fi
