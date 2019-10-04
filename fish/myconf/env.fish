#!/usr/bin/env fish

# Language
set -x DEVROOT "$HOME/dev"

# Go
set -x GOPATH "$DEVROOT/go"
set -x GOENV_ROOT "$GOPATH/env/.goenv"
## Ghq
set -x GHQ_ROOT "$GOPATH/src"

# Python
set -x PYENV_ROOT "$DEVROOT/env/.pyenv"
source (pyenv init - | psub)

# FZF
set -x FZF_DEFAULT_COMMAND 'rg --files --hidden --follow --glob "!.git/*"'
set -x FZF_LEGACY_KEYBINDINGS 1
set -x FZF_PREVIEW_FILE_CMD "head -n 10"
set -x FZF_PREVIEW_DIR_CMD "ls"
## Tmux
#set -x FZF_TMUX_HEIGHT "40%"
#set -x FZF_DEFAULT_OPTS "--height $FZF_TMUX_HEIGHT"
