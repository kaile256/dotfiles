#!/usr/bin/env bash

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.


#mesg n || true

# Xserver
#[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
#exec qtile

( type xinput && xinput disable Elan\ Touchpad ) >/dev/null 2>&1

source ~/.config/bash/env.sh # includes initial XDG_BASEs.
source ~/.config/bash/path.sh
#source ~/.config/bash/alias.sh # no use for fish on vim

# INIT
#eval "$(anyenv init -)"
#eval "$(pyenv init -)"
#eval "$(pyenv virtualenv-init -)"

