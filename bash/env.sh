#!/usr/bin/env bash

set -Ceu

export EDITOR=nvim
export VISUAL=nvim

export TERM=xterm-256color

### PROMPT
PS1='${debian_chroot:+($debian_chroot)}\h:\w\$ '
	
### FZF
if 
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'

