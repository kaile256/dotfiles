#!/usr/bin/env bash

#### To: .bashrc.
#### Ref: pkgm.sh
#### Ref: xserver/.xinitrc

# see /usr/share/doc/bash/examples/startup-files for examples.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.


if [ -d /data/data/com.termux ] && [ -x ~/skali.sh ]; then
  cd ~
  ./start-kali.sh
fi

#mesg n || true

#### INIT
eval "$(anyenv init -)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

#### Xserver
#[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
