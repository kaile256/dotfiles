#!/usr/bin/env bash

# Original {{{1
export MY_SCRIPTS="$HOME/.myscripts"
export MY_API_TOKEN="$HOME/.myapi"
export DOTFILES_HOME="$HOME/dotfiles"

export MY_DEV="$HOME/dev"
export MY_MEMO="$HOME/Memo"
export MY_SUMMURY="$MY_MEMO/summary"

# Global {{{1
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

# Locale
export LC_TIME=en_US.UTF-8
# for docui, which is the client for docker on TUI
export LC_CTYPE=en_US.UTF-8
#export LANG=ja_JP.UTF-8

# Ref: https://qiita.com/gyu-don/items/d61b03e0222a7f1ce9f7
# available icons on Qt/KDE
#export QT_QPA_PLATFORMTHEME=qt5ct
# Ref: https://www.reddit.com/r/qutebrowser/comments/enr181/how_to_switch_default_file_manager/
#   enable the imo nicer looking GTK file picker.
export QT_QPA_PLATFORMTHEME=gtk3

# Cloud {{{1
# gcloud: a cli-tool for GCP
# Ref: https://cloud.google.com/sdk/gcloud/reference/topic/startup
export CLOUDSDK_PYTHON=python3
export CLOUDSDK_GSUTIL_PYTHON=python3
export CLOUDSDK_BQ_PYTHON=python3

# Apps {{{1
# Japanese IM
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

# Terminal
export TERM=xterm-256color
export COLORTERM=xterm-256color
# for transparency on xterm
([ -n "$XTERM_VERSION" ] && transset-df --id "$WINDOWID")>/dev/null

# nvr & nvim-qt does NOT work for sudoedit.
export EDITOR=nvim-qt
export VISUAL=nvim-qt
export SUDO_EDITOR=vi

# Browser
export BROWSER=qutebrowser

# Docker
export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/docker.sock

# Note: vim will override $VMAIL_VIM=nvr.
export VMAIL_VIM=$VISUAL

# FZF
export FZF_DEFAULT_COMMAND='rg --no-line-number --files --hidden --follow --glob "!.git/*"'
# Neither 'shift-ctrl-' nore 'ctrl-shift-' is unsupported.
export FZF_DEFAULT_OPTS='--reverse --height=80% --min-height=20 --no-mouse --multi --preview-window=noborder --bind=ctrl-o:up+toggle'
#--preview="bat  --color=always --style=header,grid --line-range :100 {}"

export FZF_LEGACY_KEYBINDINGS=0
export FZF_PREVIEW_FILE_CMD="head -n 10"
export FZF_PREVIEW_DIR_CMD="ls"

## Tmux
#export FZF_TMUX_HEIGHT="40%"
#export FZF_DEFAULT_OPTS="--height $FZF_TMUX_HEIGHT"

## Vim
export THEMIS_HOME=$XDG_CONFIG_HOME/nvim/data/bin/themis

# Language {{{1
# Go
export GOPATH="$HOME/.go"
## Ghq
export GHQ_ROOT="$XDG_DATA_HOME/ghq"

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
