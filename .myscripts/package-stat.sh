#!/usr/bin/env bash

package_check() {
  if type pacman >/dev/null; then
    if type yay >/dev/null; then
      CHECKER='yay -Qu'
    else
      CHECKER='checkupdates'
    fi

    if ! updates=$("$CHECKER" 2> /dev/null | wc -l); then
      updates=0
    fi
  fi

  if [ "$updates" -gt 2 ]; then
    echo " $updates"
  else
    echo " $updates"
  fi
}

package_update() {
  echo

  if type pacman >/dev/null; then
    if type yay >/dev/null ; then
      echo 'Package: "yay -Syu"'
      echo
      yay -Syu
    else
      echo 'Package: "pacman -Syu"'
      echo
      sudo pacman -Syu
    fi
  fi

  echo

  read -r -p "Press enter to close this window..."
}

case "$1" in
  --update)
    package_update
    ;;
  *)
    package_check
    ;;
esac
