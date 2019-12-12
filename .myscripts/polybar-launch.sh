#!/usr/bin/env bash
# Ref: https://github.com/polybar/polybar/wiki
# Conf: polybar/config
# i3: i3/config

#if [[ $1 = "restart" ]]; then
## https://tonooo71.github.io/2018/06/180607_polybar_setting/
## Note: seems only to open twice a polybar
#        i3-msg restart
#        sleep 0.1
#fi

# Terminate already running bar instances
killall --quiet polybar

while pgrep -u $UID -x polybar >/dev/null; do sleep 0.08; done

LABEL=(
  main   # /tmp/polybar-main.log
  top    # /tmp/polybar-top.log
  bottom # /tmp/polybar-bottom.log
)

for n in "${LABEL[@]}"; do
  LOG="/tmp/polybar-${n}.log"
  DATE=$(date '+%T')

  printf "                 at %s, Polybar Launching...\n" "$DATE" >> "$LOG" 2>&1
  echo '========================================' >> "$LOG"

  for m in $(polybar --list-monitors | cut -d':' -f1); do
    # Ref: https://raw.githubusercontent.com/edbizarro/dotfiles/7e45d14887846c204b893d4cedb6af00f54887ad/i3/.i3/startup/polybar.sh
    MONITOR=$m polybar --reload "$n" >> "$LOG" 2>&1 &
  done
done

