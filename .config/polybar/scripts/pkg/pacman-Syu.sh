#!/bin/bash

if type yay >/dev/null ; then
  echo 'updates.sh: "yay -Syu"'
  echo
  yay -Syu
else
  echo 'updates.sh: "pacman -Syu"'
  echo
  sudo pacman -Syu
fi

echo
read -r -p "Press enter to close this window..."
