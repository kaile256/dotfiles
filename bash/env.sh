#!/usr/bin/env bash

#### From: .bashrc
#### Before: path.sh
#### Ref: .zshenv
#### Ref: config.fish

set -Cu

type nvim > /dev/null && {
  export EDITOR=nvim
  export VISUAL=nvim
} || {
export EDITOR=vi
export VISUAL=vi
}

export TERM=xterm-256color

#### TOOL
### FZF
type rg > /dev/null && {
  export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
}

### Browser
type qutebrowser > /dev/null && export BROWSER=qutebrowser || {
  type w3m > /dev/null && export BROWSER=w3m || {
  type lynx > /dev/null && {
  export BROWSER=lynx &&
  export LYNX_CFG='~/.config/lynx/lynx.cfg'
  } || {
    type firefox > /dev/null && export BROWSER=firefox
  }
}
}

#### LANGUAGE
### Go
export GOPATH="$HOME/go"
## Ghq
export GHQ_ROOT="$GOPATH/src"

### Nodejs
# TODO: ~/.local/share/yarn/global/node_modules?
#export npm_config_prefix=~/.node_modules
