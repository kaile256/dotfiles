#!/usr/bin/env bash

# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.

# Before .bashrc.
if [ -d /data/data/com.termux ] && [ -x ~/start*.sh ]; then
  cd ~
  ./start-kali.sh
fi

#if [ "$ZSH" ]; then
#  . ~/.config/zsh/zshrc
#fi

if [ -f ~/.config/bash/.bashrc ]; then
  . ~/.config/bash/.bashrc
fi

#mesg n || true

export PATH="/home/kaile256/.local/share/cargo/bin:$PATH"
