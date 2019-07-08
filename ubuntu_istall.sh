#!/bin/bash
#! /bin/bash

# when Ubuntu
INSTALLERS="$HOME/dotfiles/installer.d"
XDG_CONFIG_HOME="$HOME/.config"
XDG_CACHE_HOME="$HOME/.cache"

echo "Modifying permissions..."
chown -R kaile256:kaile256 $XDG_CACHE_HOME
chmod -R u+x $XDG_CACHE_HOME
echo "Done!"

source ${INSTALLERS}/dein_install.sh ~/.cache/nvim/dein
source ${INSTALLERS}/symlink_install.sh
source ${INSTALLERS}/apt_install.sh
source ${INSTALLERS}/linuxbrew_install.sh

echo "FIN"
