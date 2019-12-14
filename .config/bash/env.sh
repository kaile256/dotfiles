#!/usr/bin/env bash

export MYSCRIPTS="$HOME/.myscripts"

# XDG Base Directory {{{
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
#}}}

# for docui, which is the client for docker on TUI
export LC_CTYPE=en_US.UTF-8
#export LANG=ja_JP.UTF-8

# nvr & nvim-qt does NOT work for sudoedit.
export EDITOR=nvim-qt
export VISUAL=nvim-qt
export SUDO_EDITOR=vi

# Terminal
export TERM=xterm-256color
export COLORTERM=xterm-256color

# Japanese IM
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

# App
# Note: vim will override $VMAIL_VIM=nvr.
export VMAIL_VIM=nvim-qt

# Browser
export BROWSER=qutebrowser
# FZF
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
export FZF_DEFAULT_OPTS='--reverse --height=80% --min-height=20 --no-mouse --multi'
#--preview="bat  --color=always --style=header,grid --line-range :100 {}"

export FZF_LEGACY_KEYBINDINGS=1
export FZF_PREVIEW_FILE_CMD="head -n 10"
export FZF_PREVIEW_DIR_CMD="ls"
## Tmux
#export FZF_TMUX_HEIGHT="40%"
#export FZF_DEFAULT_OPTS="--height $FZF_TMUX_HEIGHT"

# Go
export GOPATH="$HOME/.go"
## Ghq
export GHQ_ROOT="$GOPATH/src"

# Rust
export CARGO_HOME="$HOME/.cargo"
export RUSTUP_HOME="$HOME/.rustup"

# Python
export PYENV_ROOT="$HOME/.pyenv"
export MYPY_CACHE_DIR="$XDG_CACHE_HOME/.mypy_cache"

# Ruby
export GEM_HOME="$HOME/.gem"

# Haskell
export STACK_ROOT="$HOME/.haskell/stack"
