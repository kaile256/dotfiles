#!/usr/bin/env bash

set -Ceu

## Stop if not debian-based.
ls -a /etc | grep debian

XDG_CONFIG_HOME="$HOME/.config"
XDG_CACHE_HOME="$HOME/.cache"

INSTALLERS="$HOME/installers"

PKG="${INSTALLERS}/pkgm.d"
INIT="${INSTALLERS}/init.d"
GIT="${INSTALLERS}/git.d"
PERMISSION="${INSTALLERS}/permission.d"

DEIN_CACHE="${XDG_CACHE_HOME}/nvim/dein"

### Modify Permission

source ${PERMISSION}/cache.sh

### Install
## PKG
source ${PKG}/apt.d/prepare.sh
## Install linuxbrew only if not-rolling released.
cat /etc/lsb-release | grep rolling ||
cat /etc/lsb-release | grep Rolling ||
  source ${PKG}/linuxbrew.d/essential.sh

## INIT
if ! [ -d ${DEIN_CACHE} ]; then
  source ${INIT}/dein.sh ~/.cache/nvim/dein
fi

cat << EOD
================================================================================

YOUR ENVIRONMENT IS READY!!

================================================================================
EOD
