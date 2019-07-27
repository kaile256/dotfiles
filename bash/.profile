#!/usr/bin/env bash

#### To: .bashrc.
#### Ref.: xserver/.xinitrc
# see /usr/share/doc/bash/examples/startup-files for examples.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.


if [ -d /data/data/com.termux ] && [ -x ~/start*.sh ]; then
  cd ~
  ./start-kali.sh
fi

if [ -f ~/.config/bash/.bashrc ]; then
  . ~/.config/bash/.bashrc
fi

#mesg n || true

#### PARH
export PATH="$HOME/.local/bin:$PATH"
### LANGUAGE 
## Rust
# cargo
if [ -d ~/.cargo ]; then
  export PATH="$HOME/.cargo/bin:$PATH"
else
  export PATH="$HOME/.local/share/cargo/env:$PATH"
  export PATH="$HOME/.local/share/cargo/bin:$PATH"
fi

## Python
# pyenv
export PATH="$HOME/.pyenv/bin:$PATH"

## Ruby
# gem
type ruby >> /dev/null && eval ruby --version | grep 2.6. >> /dev/null &&
  export PATH="$HOME/.gem/2.6.0:$PATH"

## Nodejs
export PATH="$HOME/.node_modules/bin:$PATH"
# nodebrew
export PATH="$HOME/.nodebrew/current/bin:$PATH"
# yarn
export PATH="$PATH:$HOME/`yarn global bin`"

export PATH="/home/kaile256/.local/share/cargo/bin:$PATH"

#### Xserver
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
