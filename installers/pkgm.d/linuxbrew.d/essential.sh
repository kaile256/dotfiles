#!/usr/bin/env bash
# install linuxbrew & brew formulae.

sudo apt install build-essential

echo "Installing Linuxbrew..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
echo "Done!"

echo "Installing environment of kaile256..."
echo "Modifying permissions..."
LINUXBREW=/home/linuxbrew/.linuxbrew
if ! [ -d $LINUXBREW ]; then
  ln -s $LINUXBREW $HOME
fi
sudo chown $(whoami):$(whoami) -R /home/linuxbrew
sudo chmod -R u+x $HOME/.linuxbrew/bin
echo "Done!"

LINKED=/home/linuxbrew/.linuxbrew/var/homebrew/linked
if ! [ -d $LINKED ]; then
  sudo mkdir -p $LINKED
  sudo chown -R $(whoami) $LINKED
fi
exec -l bash

echo 'run brew doctor...'
which brew > /dev/null 2>&1 && brew doctor

echo 'run brew update...'
which brew > /dev/null 2>&1 && brew update

echo 'run brew upgrade...'
brew upgrade

### brew-neovim
echo "Installing NeoVim..."
brew install neovim

cat << END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
HOMEBREW ESSENTIALS ARE INSTALLED
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

END

