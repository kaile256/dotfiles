#!/usr/bin/env bash

set -Cu

#### From: .bashrc

export EDITOR=nvim
export VISUAL=nvim

export TERM=xterm-256color
export BROWSER=w3m

#### TOOL
### FZF
if [ -x "$(which rg)" ]; then
  export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
fi

### Browser
## Lynx
export LYNX_CFG='~/.config/lynx/lynx.cfg'

#### LANGUAGE
### Nodejs
export npm_config_prefix=~/.node_modules
