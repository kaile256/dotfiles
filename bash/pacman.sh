#!/usr/bin/env bash

set -Ceu

#### For: pacman

if [ -x $(which pacman) ]; then
  sudo pacman -Syu

  #### LANGUAGE
  ### Python
  ## pip3
  sudo pacman -Sy pip3
fi
