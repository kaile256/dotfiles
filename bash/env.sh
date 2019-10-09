#!/usr/bin/env bash

# XDG Base Directory {{{
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_DATA_HOME="${HOME}/.local/share"
#}}}

# nvr & nvim-qt does NOT work as sudoedit.
export EDITOR=nvim
export VISUAL=nvim
export SUDO_EDITOR=nvim

# Terminal
export TERM=rxvt-unicode
export COLORTERM=rxvt-unicode

# Japanese IM
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

# Browser
export BROWSER=qutebrowser
# FZF
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
export FZF_LEGACY_KEYBINDINGS=1
export FZF_PREVIEW_FILE_CMD="head -n 10"
export FZF_PREVIEW_DIR_CMD="ls"
## Tmux
#export FZF_TMUX_HEIGHT="40%"
#export FZF_DEFAULT_OPTS="--height $FZF_TMUX_HEIGHT"

# Go
export DEVROOT="$HOME/dev"
export GOPATH="$DEVROOT/go"
## Ghq
export GHQ_ROOT="$GOPATH/src"

# Rust
export CARGO_HOME="$DEVROOT/cargo"
export RUSTUP_HOME="$DEVROOT/rustup"

# Python
export PYENV_ROOT="$DEVROOT/env/pyenv"

# Ruby
export GEM_HOME="$DEVROOT/gem"

# Haskell
export STACK_ROOT="$DEVROOT/haskell/stack"
