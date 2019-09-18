#!/usr/bin/env bash

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.


#mesg n || true

# INIT
eval "$(anyenv init -)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Xserver
#[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
#exec qtile
