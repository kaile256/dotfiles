#!/usr/bin/env bash

#### From: .bashrc
#### Before: path.sh
#### Ref: .zshenv
#### Ref: config.fish

set -Cu

type nvim-qt > /dev/null && {
  export EDITOR=nvim-qt
  export VISUAL=nvim-qt
} || {
  type nvim > /dev/null && {
  export EDITOR=nvim
  export VISUAL=nvim
}
} || {
  export EDITOR=vi
  export VISUAL=vi
}

export TERM=xterm-256color

#### FONTS
export DefaultIMModule=fcitx
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

#### TOOL
### FZF
type rg > /dev/null && {
  export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
  export FZF_LEGACY_KEYBINDINGS=1
  export FZF_PREVIEW_FILE_CMD="head -n 10"
  export FZF_PREVIEW_DIR_CMD="ls"
  ## Tmux
  #export FZF_TMUX_HEIGHT="40%"
  #export FZF_DEFAULT_OPTS="--height $FZF_TMUX_HEIGHT"
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
