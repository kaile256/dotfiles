#!/usr/bin/env bash

# Note: sleep 1 to suspend correctly
#   @ https://wiki.archlinux.jp/index.php/I3
# mv wallpapers in /usr/share/backgrounds/

# Note: the image must be a png format.
IMAGE="$MY_MEMO/data/wallpaper/Zion-National-Park-Springdale-Utah-USA.png"
# Man: i3lock(1)
i3lock --ignore-empty-password --nofork --image "$IMAGE" && sleep 1

#light-locker-command --lock
