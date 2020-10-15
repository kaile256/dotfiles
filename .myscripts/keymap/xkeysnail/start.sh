#!/usr/bin/env bash

set -Ceu
IFS=$'\n\t'

# Ref: https://hidakatsuya.hateblo.jp/entry/2019/11/20/215608



SCRIPT_DIR=$(readlink -f "$0" | xargs dirname)

RK61=$(grep -A 5 SONiX < /proc/bus/input/devices \
  | grep -e 'Handlers=.*sysrq' \
  | awk '{print $4}')

sudo xkeysnail --devices "/dev/input/$RK61" "$SCRIPT_DIR/RK61/config.py" &

sudo xkeysnail "$SCRIPT_DIR/config.py" &
