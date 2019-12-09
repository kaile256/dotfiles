#!/usr/bin/env bash
# Ref: https://github.com/polybar/polybar/wiki
# Conf: polybar/config

## restart i3
if [[ $1 = "restart" ]]; then
# https://tonooo71.github.io/2018/06/180607_polybar_setting/
        i3-msg restart
        sleep 0.1
fi

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 0.1; done

# Launch top and bottom
echo 'Bars launching...' \
  | tee -a /tmp/polybar-top.log /tmp/polybar-bottom.log /tmp/polybar-main.log

polybar top    >> /tmp/polybar-top.log    2>&1 &
polybar main   >> /tmp/polybar-main.log   2>&1 &
polybar bottom >> /tmp/polybar-bottom.log 2>&1 &

#for m in $(polybar -m|tail -1|sed -e 's/:.*$//g'); do
for m in $(polybar --list-monitors | cut -d":" -f1); do
  # Ref: https://raw.githubusercontent.com/edbizarro/dotfiles/7e45d14887846c204b893d4cedb6af00f54887ad/i3/.i3/startup/polybar.sh
  MONITOR=$m polybar --reload main &
  #MONITOR=$m polybar --reload bottom -r&
  #MONITOR=$m polybar --reload top -r&
done

