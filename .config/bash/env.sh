#!/usr/bin/env bash

# Global {{{1
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

# Original {{{1
export MY_I3_SCRIPTS="$XDG_CONFIG_HOME/i3/script"

export MY_SCRIPTS="$HOME/.myscripts"
export MY_API_TOKEN="$HOME/.myapi"
export DOTFILES_HOME="$HOME/dotfiles"

export MY_DEV="$HOME/dev"
export MY_MEMO="$HOME/Memo"
export MY_SUMMURY="$MY_MEMO/summary"

# Locale
export LC_TIME=en_US.UTF-8
# for docui, which is the client for docker on TUI
export LC_CTYPE=en_US.UTF-8
#export LANG=ja_JP.UTF-8

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
# Define the values in ~/.pam_environment.  Though the settings are
# unrecommended to add `.bashrc`, some Qt5 + fcitx apps currently require these
# settings there, addition to the ~/.pam_environment.
export INPUT_METHOD=fcitx
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

# Terminal
export TERM=xterm-256color
export COLORTERM=xterm-256color
# for transparency on xterm
([ -n "$XTERM_VERSION" ] && transset-df --id "$WINDOWID")>/dev/null

if type nvim-qt >/dev/null 2>&1 ; then
  # nvr & nvim-qt does NOT work for sudoedit.
  export EDITOR=nvim-qt
  export VISUAL=nvim-qt
  export SUDO_EDITOR=nvim-qt
fi

# Browser
export BROWSER=qutebrowser

# Docker
export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/docker.sock

# Note: vim will override $VMAIL_VIM=nvr.
export VMAIL_VIM=$VISUAL

# FZF
if type rg >/dev/null 2>&1; then
  export FZF_DEFAULT_COMMAND='rg --no-line-number --files --hidden --follow --glob "!{.git,node_modules}/*"'
fi

# Note: Neither 'shift-ctrl-' nore 'ctrl-shift-' is unsupported.
# Note: ctrl-\ throws `unsupported key: ctrl-`; moreover, <C-\> in Vim's
# terminal awaits <C-\><C-n>.
export FZF_DEFAULT_OPTS="
  --reverse
  --height=80%
  --min-height=20
  --no-mouse
  --multi
  --preview-window=noborder:100
  --history=$XDG_DATA_HOME/fzf-history/default

  --bind=ctrl-j:accept
  --bind=ctrl-k:kill-line

  --bind=ctrl-i:toggle+down
  --bind=ctrl-o:up+toggle

  --bind=ctrl-g:down
  --bind=ctrl-t:up
  --bind=ctrl-space:toggle

  --bind=esc:clear-selection

  --bind=ctrl-]:toggle-preview

  --bind=shift-tab:jump
  --jump-labels=hjklgfdsayuiotrewnmvcx
  "

export FZF_LEGACY_KEYBINDINGS=0
export FZF_PREVIEW_FILE_CMD="head -n 10"
export FZF_PREVIEW_DIR_CMD="ls"

## Tmux
#export FZF_TMUX_HEIGHT="40%"
#export FZF_DEFAULT_OPTS="--height $FZF_TMUX_HEIGHT"

## Vim
export THEMIS_HOME="$XDG_CACHE_HOME/dein/repos/github.com/thinca/vim-themis"

# GTag
export GTAGSCONF=/usr/share/gtags/gtags.conf
export GTAGSLABEL=pygments

# Language {{{1
# Go
export GOPATH="$HOME/.go"
## Ghq
export GHQ_ROOT="$HOME/.ghq"

# Rust
export CARGO_HOME="$HOME/.cargo"
export RUSTUP_HOME="$HOME/.rustup"

# Python
export PYENV_ROOT="$HOME/.pyenv"
export MYPY_CACHE_DIR="$XDG_CACHE_HOME/.mypy_cache"

## Ruby
#export GEM_HOME="$HOME/.gem"

# Haskell
export STACK_ROOT="$HOME/.haskell/stack"
