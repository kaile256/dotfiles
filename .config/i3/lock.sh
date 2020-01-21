#!/usr/bin/env bash

# Note: sleep 1 to suspend correctly
#   @ https://wiki.archlinux.jp/index.php/I3
# mv wallpapers in /usr/share/backgrounds/

# Man: i3lock(1)
i3lock --ignore-empty-password --nofork --image /usr/share/backgrounds/wall.png && sleep 1

#light-locker-command --lock
