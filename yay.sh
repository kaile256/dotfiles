#!/usr/bin/env bash
# ref: list.sh
# ref: apt.sh
set -Cu

sudo pacman-mirrors --fasttrack && sudo pacman -Syyu

for package in ${Package[@]}; do
  if $INSTALLER == 'yay'; then
    echo "Installing $package..." && yay -S $package
  fi
done
