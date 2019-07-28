#!/usr/bin/env bash

#### Ref: pkgm.sh
#### Ref: symlink.sh
set -Cu

#### Accurate Time
type ntp > /dev/null || sudo pacman -S ntp
sudo timedatectl set-ntp true
