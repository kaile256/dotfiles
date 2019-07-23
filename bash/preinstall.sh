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
  echo "Done!"
fi

### Cargo -- rust
if ! [ -d ~/.cargo/bin ]; then
	echo "Installing cargo..."
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  echo "Done"
fi

### Dein -- vim
PLUGIN_DIR=$HOME/.cache//nvim/dein
INSTALL_DIR="${PLUGIN_DIR}/repos/github.com/Shougo/dein.vim"
echo "Install to \"$INSTALL_DIR\"..."
if [ -e "$INSTALL_DIR" ]; then
  echo "\"$INSTALL_DIR\" already exists!"
fi

echo ""

# check git command
type git || {
  echo 'Please install git or update your path to include the git executable!'
exit 1
}
echo ""

# make plugin dir and fetch dein
if ! [ -e "$INSTALL_DIR" ]; then
  echo "Begin fetching dein..."
  mkdir -p "$PLUGIN_DIR"
  git clone https://github.com/Shougo/dein.vim "$INSTALL_DIR"
  echo "Done."
  echo ""
fi
cat << EOD
  =============================================================================

  DEIN INSTALLED!!

  =============================================================================

EOD
