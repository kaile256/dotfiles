#!/usr/bin/env bash

# Before: path.sh
# From: bash/.bashrc
#  Ref: .zshenv
#  Ref: config.fish
#  Ref: .xprofile
#  Ref: .xinitrc

set -Cu

# nvr & nvim-qt does NOT work as sudoedit.
type nvr > /dev/null && {
  export EDITOR=nvr
  export VISUAL=nvr
  export SUDO_EDITOR=nvr
} || {
type nvim > /dev/null && {
  export EDITOR=nvim
  export VISUAL=nvim
  export SUDO_EDITOR=nvim
}
} || {
  type vim > /dev/null && {
  export EDITOR=vim
  export VISUAL=vim
}
} || {
  type vi > /dev/null && {
  export EDITOR=vi
  export VISUAL=vi
}
}

# Terminal
export TERM=rxvt-unicode
export COLORTERM=rxvt-unicode

# Japanese IM
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

# Browser
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

# FZF
type rg > /dev/null && {
  export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
  export FZF_LEGACY_KEYBINDINGS=1
  export FZF_PREVIEW_FILE_CMD="head -n 10"
  export FZF_PREVIEW_DIR_CMD="ls"
  ## Tmux
  #export FZF_TMUX_HEIGHT="40%"
  #export FZF_DEFAULT_OPTS="--height $FZF_TMUX_HEIGHT"
}

# Language; Go
export GOPATH="$HOME/go"
## Ghq
export GHQ_ROOT="$GOPATH/src"

# Language; Nodejs
# TODO: ~/.local/share/yarn/global/node_modules?
#export npm_config_prefix=~/.node_modules
