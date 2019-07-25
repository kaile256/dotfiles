#!/usr/bin/env bash

set -Ceu

#### For: pacman

if [ -e $(which pacman) ]; then
  #### LANGUAGE
  ### Python
  ## pip3
  sudo pacman -Sy pip3
fi
