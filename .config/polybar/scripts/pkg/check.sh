#!/bin/sh

if type yay >/dev/null; then
  #if ! updates=$(yay -Qum 2> /dev/null | wc -l); then
  if ! updates=$(yay -Qua 2> /dev/null | wc -l); then
      updates=0
  fi
else
  if ! updates=$(checkupdates 2> /dev/null | wc -l ); then
      updates=0
  fi
fi

#updates=$(("$updates_arch" + "$updates_aur"))

if [ "$updates" -gt 2 ]; then
    echo " $updates"
else
    echo " $updates"
fi
