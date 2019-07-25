#!/usr/bin/env bash

set -Ceu

export EDITOR=nvim
export VISUAL=nvim

export TERM=xterm-256color
export BROWSER=w3m

### PROMPT
PS1='${debian_chroot:+($debian_chroot)}\h:\w\$ '
	
### FZF
if [ -x "$(which rg)" ]; then
  export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
fi
### Lynx
export LYNX_CFG='~/.config/lynx/lynx.cfg'
