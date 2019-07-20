#!/usr/bin/env bash

set -Ceu

# update the package manager
pacman -Syu

source pacman.d/*.sh
