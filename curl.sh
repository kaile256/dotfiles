#!/usr/bin/env bash

#### Ref.: pkgm.sh

#set -Ce

#### TOOL
### less -- pager
if ! [ -d "$HOME/.cache/less" ]; then 
  mkdir -p "$HOME/.cache/less"
fi

### Vim
## Dein
PLUGIN_DIR=$HOME/.cache/nvim/dein
INSTALL_DIR="${PLUGIN_DIR}/repos/github.com/Shougo/dein.vim"

if ! [ -e "$INSTALL_DIR" ]; then
  # check git command
  type git || {
    echo ""
      echo 'Please install git or update your path to include the git executable!'
      exit 1
    }
  echo ""

  echo "Begin fetching dein..."
  mkdir -p "$PLUGIN_DIR"
  git clone https://github.com/Shougo/dein.vim "$INSTALL_DIR"
  echo "Done. Dein is Ready!!"
  echo ""
fi

#### LANGUAGE
### Python
## pyenv
if ! [ -d ~/.pyenv/bin ]; then
  echo "Installing pyenv..."
  curl https://pyenv.run | bash
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
  echo "Done!"
fi

### Rust
## Cargo
#&& [ ! -d /data/data/com.termux  # ???
type cargo || {
  echo "Installing cargo..."
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  source ~/.local/share/cargo/env
  ## TODO: del lines including '.cargo' in .profile.
  echo "Done"
}
