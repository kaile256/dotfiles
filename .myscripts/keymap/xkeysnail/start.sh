#!/usr/bin/env bash

set -Ceuo pipefail
IFS=$'\n\t'

# Ref: https://hidakatsuya.hateblo.jp/entry/2019/11/20/215608

SCRIPT_DIR=$(readlink -f "$0" | xargs dirname)

RK61=$(grep -A 5 SONiX < /proc/bus/input/devices \
  | grep -e 'Handlers=.*sysrq' \
  | awk '{print $4}')

cd "$SCRIPT_DIR" && sudo xkeysnail config.py &

[ -n "$RK61" ] && \
  cd "$SCRIPT_DIR/RK61" && \
  sudo xkeysnail --devices "/dev/input/$RK61" config.py &

