#!/usr/bin/env fish

## XDG Directory Specification
set -x XDG_CONFIG_HOME $HOME/.config
set -x XDG_CACHE_HOME  $HOME/.cache
set -x XDG_DATA_HOME   $HOME/.local/share

# Japanese IM
set -x GTK_IM_MODULE fcitx
set -x QT_IM_MODULE fcitx
set -x XMODIFIERS @im=fcitx

if ! test -e "$NVIM_LISTEN_ADDRESS" ;
  set -x DEVROOT "$HOME/dev"
  # Go
  set -x GOPATH "$DEVROOT/go"

  set -x GOENV_ROOT "$GOPATH/env/.goenv"
  ## ghq
  set -x GHQ_ROOT "$GOPATH/src"

  # Rust
  ## cargo: a package manager
  set -x CARGO_HOME "$DEVROOT/cargo"
  ## rustup: an installer
  set -x RUSTUP_HOME "$DEVROOT/rustup"

  # Python
  set -x PYENV_ROOT "$DEVROOT/env/pyenv"
  source (pyenv init - | psub)
end

# FZF
set -x FZF_DEFAULT_COMMAND 'rg --files --hidden --follow --glob "!.git/*"'
set -x FZF_LEGACY_KEYBINDINGS 1
set -x FZF_PREVIEW_FILE_CMD "head -n 10"
set -x FZF_PREVIEW_DIR_CMD "ls"
## Tmux
#set -x FZF_TMUX_HEIGHT "40%"
#set -x FZF_DEFAULT_OPTS "--height $FZF_TMUX_HEIGHT"
