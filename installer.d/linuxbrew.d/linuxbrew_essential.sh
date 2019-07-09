#! /bin/bash
# install linuxbrew & brew formulae.

echo "Installing Linuxbrew..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
echo "Done!"

echo "Installing environment of kaile256..."
echo "Modifying permissions..."
sudo chown kaile256:kaile256 -R /home/linuxbrew
ln -s /home/linuxbrew/.linuxbrew $HOME/.linuxbrew
sudo chmod -R u+x $HOME/.linuxbrew/bin
echo "Done!"

#test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
#test -d /home/linuxbrew/.linuxbrew && eval $(home/linuxbrew/.linuxbrew/bin/brew shellenv)
#test -r ~/.bash_profile && echo "eval \$($brew --prefix)/bin/brew shellenv" >> ~/.bash_profile
#echo "eval \$($(brew --prefix)/bin/brew shellenv)" >> ~/.profile
#exec bash

echo 'run brew doctor...'
which brew > /dev/null 2>&1 && brew doctor

echo 'run brew update...'
which brew > /dev/null 2>&1 && brew update

echo 'run brew upgrade...'
brew upgrade

### brew-neovim
brew install neovim ruby python yarn pyenv
echo "/home/linuxbrew/.linuxbrew/bin/nvim" > /etc/shells

cat << END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
HOMEBREW ESSENTIALS ARE INSTALLED
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

END

