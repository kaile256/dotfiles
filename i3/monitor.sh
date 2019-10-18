#!/usr/bin/env bash

# From: i3/config
External="HDMI2"

xrandr | grep "$External connected" \
    && xrandr --output eDP1 --auto \
              --output "$External" --auto --above eDP1

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
