#!/usr/bin/env bash
# Ref: https://github.com/polybar/polybar/wiki
# Conf: polybar/config
# i3: i3/config

set -Cue

LOG_ROOT="/var/tmp"

BARNAME=(
  main   # /tmp/polybar-main.log
  #top    # /tmp/polybar-top.log
  #bottom # /tmp/polybar-bottom.log
)

__launch_only() {
  for b in "${BARNAME[@]}"; do
    for m in $(polybar --list-monitors | cut -d':' -f1); do
      # Ref: https://raw.githubusercontent.com/edbizarro/dotfiles/7e45d14887846c204b893d4cedb6af00f54887ad/i3/.i3/startup/polybar.sh
      MONITOR=$m polybar --reload "$b" &
    done
  done
}

#if [[ $1 = "restart" ]]; then
## https://tonooo71.github.io/2018/06/180607_polybar_setting/
## Note: seems only to open twice a polybar
#        i3-msg restart
#        sleep 0.1
#fi

__launch_with_log() {
  local LOG
  local DATE

  for b in "${BARNAME[@]}"; do
    LOG="$LOG_ROOT/polybar-${b}.log"
    DATE=$(date '+%T')

    echo "                          at $DATE Polybar Launching..." >> "$LOG" 2>&1

    for m in $(polybar --list-monitors | cut -d':' -f1); do
      # Ref: https://raw.githubusercontent.com/edbizarro/dotfiles/7e45d14887846c204b893d4cedb6af00f54887ad/i3/.i3/startup/polybar.sh
      MONITOR=$m polybar --reload "$b" >> "$LOG" 2>&1 &
    done

    echo '==================================== END' >> "$LOG"
    echo >> "$LOG"
  done
}

__kill_polybar() {
  # Terminate already running bar instances
  killall --quiet polybar && true

  while pgrep -u $UID -x polybar >>/dev/null; do sleep 1; done
}

restart_polybar() {
  __kill_polybar
  __launch_only
}

restart_polybar_with_log() {
  __kill_polybar
  __launch_with_log
}

set +u

case "$1" in
  --debug)
    restart_polybar_with_log
    ;;

  *)
    restart_polybar
    ;;
esac
