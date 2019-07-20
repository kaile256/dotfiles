#!/usr/bin/env bash

set -Ceu

APPS=(
  vim
  neovim
  tmux
  fish
  )

for app in ${APPS[@]}; do
  echo "Installing $app..."
  pacman -Sy $app
  echo "Done! ${app} was installed."
done

cat << EOD
================================================================================

ESSENTIAL APPS WERE ALL INSTALLED

================================================================================
EOD
