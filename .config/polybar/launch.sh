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

# Launch top and bottom
echo -n 'Bars launching...' \
  | tee -a /tmp/polybar-top.log /tmp/polybar-bottom.log /tmp/polybar-main.log

#for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
for m in $(polybar --list-monitors | cut -d':' -f1); do
  # Ref: https://raw.githubusercontent.com/edbizarro/dotfiles/7e45d14887846c204b893d4cedb6af00f54887ad/i3/.i3/startup/polybar.sh
  MONITOR=$m  polybar --reload main   >> /tmp/polybar-main.log 2>&1 &
  #MONITOR=$m polybar --reload top    >> /tmp/polybar-top.log 2>&1 &
  #MONITOR=$m polybar --reload bottom >> /tmp/polybar-bottom.log 2>&1 &
done

