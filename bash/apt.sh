#!/usr/bin/env bash

set -Ceu

#### After: xdg.sh
#### For:   apt

#### LANGUAGE
### Python
## pip
if ! [ -x $(which pip3) ]; then
  echo "Installing pip3..."
  sudo apt install pip3
fi

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
if [ ! -d ~/.cargo/bin ] && [ ! -d /data/data/com.termux ]; then
  echo "Installing cargo..."
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  source ~/.local/share/cargo/env
  ## TODO: del lines including '.cargo' in .profile.
  echo "Done"
fi

#### TOOL
### less -- pager
if ! [ -d "$HOME/.cache/less" ]; then 
  mkdir -p "$HOME/.cache/less"
fi

### Vim
## Dein
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

## yarn
if [ -e $(which yarn) ]; then
  echo "Installing yarn..."
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
  echo "Update apt for yarn!"
  sudo apt update && sudo apt install yarn
  echo "Done! Yarn is Ready!!"
  ## LSP
  yarn add bash-language-server
fi
