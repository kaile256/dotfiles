#!/usr/bin/env zsh

# To: .bashrc.
# Ref: pkgm.sh
# Ref: xserver/.xinitrc

# see /usr/share/doc/bash/examples/startup-files for examples.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.

#mesg n || true

# INIT
#eval "$(anyenv init -)"
#eval "$(pyenv init -)"
#eval "$(pyenv virtualenv-init -)"

# config in starship.toml
eval "$(starship init zsh)"
#. ~/.config/zsh/.zshrc

# Xserver
#[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
