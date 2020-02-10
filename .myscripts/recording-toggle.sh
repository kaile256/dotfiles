#!/usr/bin/env bash

set -Cue

if pgrep screenkey || pgrep peek ; then
  killall --quiet screenkey peek ffmpeg
else
  notify-send --expire-time 1100 --urgency critical "Recording: Start"

  # Note: 950 is about half of T490s screen; x1200 is about bottom
  # Web: https://gitlab.com/wavexx/screenkey#advanced-usage
  # Note: press both shift/ctrl/alt to disable screenkey temporarily
  # GUI Config: `$ screenkey --show-settings`
  screenkey \
    --opacity 0.4 \
    --geometry 950x1095 \
    --geometry 950x495 \
    --font-size small \
    --key-mode composed \
    --vis-shift \
    --mods-mode normal \
    --timeout 0.4 \
    &

  peek --no-headerbar

  while pgrep -x peek; do sleep 1; done

  killall --quiet screenkey ffmpeg
  notify-send --expire-time 1100 "Recording: END"
fi

