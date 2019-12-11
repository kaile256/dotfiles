#!/usr/bin/env bash

if pgrep screenkey || pgrep peek ; then
  notify-send "End of Recording"
  killall screenkey peek
else
  notify-send "Let's start recording!"
  screenkey -g 950x1000 -t 0.4 &
  peek
fi
