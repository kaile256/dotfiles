#!/usr/bin/env bash

set -Ceu

# After xdg.sh

### less -- pager
if ! [ -d "$HOME/.cache/less" ]; then 
  mkdir -p "$HOME/.cache/less"
fi

### Pyenv -- python
if ! [ -d ~/.pyenv/bin ]; then
  echo "Installing pyenv..."
  curl https://pyenv.run | bash
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
  echo "Done!"
fi

### Cargo -- rust
if [ ! -d ~/.cargo/bin ]; then
  if [ -d /data/data/com.termux ]; then
    curl -y --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    echo "Done"
  else
    echo "Installing cargo..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    echo "Done"
  fi
fi

### Dein -- vim
PLUGIN_DIR=$HOME/.cache//nvim/dein
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
