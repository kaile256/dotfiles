#! /bin/bash

echo "Making symbolic links..."
# $HOME
cd ~
ln -sf ~/dotfiles/tag/.ctags
ln -sf ~/dotfiles/tig/.tigrc
ln -sf ~/dotfiles/w3m ~/.w3m
ln -sf ~/dotfiles/vim ~/.vim

# $XDG_CONFIG_HOME
XDG_CONFIG_HOME="$HOME/.config"
cd $XDG_CONFIG_HOME
NVIM="$XDG_CONFIG_HOME/nvim"
if [ -e $NVIM ]; then
	rm -rf $XDG_CONFIG_HOME/nvim
fi
#TMUX="$XDG_CONFIG_HOME/tmux"
#FISH="$XDG_CONFIG_HOME/fish"
#BASH="$XDG_CONFIG_HOME/bash"
ln -nfs ~/dotfiles/nvim
ln -nfs ~/dotfiles/tmux
ln -nfs ~/dotfiles/fish
ln -nfs ~/dotfiles/bash

cd ~

echo "Done!"
