#!/usr/bin/env bash

set -Ce

fcitx-activate-mozc() {
fcitx-remote -s mozc
fcitx-watch
}

fcitx-activate-skk() {
fcitx-remote -s skk
fcitx-watch
}

fcitx-watch() {
# TODO: correctly set $WORKSPACE
WORKSPACE=$(i3-msg -t get_tree | jq -r | grep current | cut -d':' -f2 | sed -e 's/null//')
while true; do
  sleep 1
  if [ "$(fcitx-remote)" -ne 2 ] || \
    [ "$(i3-msg -t get_outputs)" -ne "$WORKSPACE" ]; then
    i3-msg mode default
    notify-send 'Fcitx: OFF'
    break
  fi
done
}

fcitx-off() {
fcitx-remote -c
}

case "$1" in
  --mozc)
    fcitx-activate-mozc
    ;;
  --skk)
    fcitx-activate-skk
    ;;
  *)
    ;;
esac
