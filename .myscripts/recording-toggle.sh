#!/usr/bin/env bash

if pgrep screenkey || pgrep peek ; then
  killall --quiet screenkey peek
else
  notify-send --expire-time 1100 --urgency critical "Recording: Start"

  # Note: 950 is about half of T490s screen; x1200 is about bottom
  screenkey \
    --opacity 0.3 \
    --position bottom \
    --geometry 950x1095 \
    --font-size small \
    --key-mode translated \
    --timeout 0.4 \
    &

  peek --no-headerbar

  while true; do
    sleep 1
    if ! pgrep peek >/dev/null; then
      killall --quiet screenkey ffmpeg
      notify-send --expire-time 1100 "Recording: END"
      break
    fi
  done
fi

