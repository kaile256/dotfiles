#!/usr/bin/env bash

# Note: sleep 1 to suspend correctly
#   @ https://wiki.archlinux.jp/index.php/I3
# mv wallpapers in /usr/share/backgrounds/

# Note: the image must be a png format.
IMAGE="$MY_MEMO/data/wallpaper/Zion-National-Park-Springdale-Utah-USA.png"

if type multilockscreen >/dev/null 2>&1 ; then
  # Repo: jeffmhubbard/multilockscreen
  # Cache an image by `multilockscreen --update "$PATH_TO_IMAGE"`.
  multilockscreen --lock --span --off 600 \
    -- --nofork
else
  i3lock --ignore-empty-password --nofork --image "$IMAGE" && sleep 1
fi

#light-locker-command --lock
