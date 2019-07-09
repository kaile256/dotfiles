#! /bin/bash

set -Ceu


echo "Making symbolic links..."
# $HOME
cd ~
ln -sf ~/dotfiles/tag/.ctags
ln -sf ~/dotfiles/tig/.tigrc
ln -sf ~/dotfiles/w3m ~/.w3m
ln -sf ~/dotfiles/vim ~/.vim

XDG_CONFIG_HOME="$HOME/.config"
#NVIM="$XDG_CONFIG_HOME/nvim"
#if [ -d $NVIM ]; then
#	rm -rf $XDG_CONFIG_HOME/nvim
#fi
#TMUX="$XDG_CONFIG_HOME/tmux"
#FISH="$XDG_CONFIG_HOME/fish"
#BASH="$XDG_CONFIG_HOME/bash"

### $XDG_CONFIG_HOME
cd $XDG_CONFIG_HOME
ln -nfs ~/dotfiles/bash
ln -nfs ~/dotfiles/nvim
ln -nfs ~/dotfiles/tmux
ln -nfs ~/dotfiles/fish

ln -nfs $XDG_CONFIG_HOME/vim ~/.vim
echo "Origanized .vim"
ln -nfs $XDG_CONFIG_HOME/bash/.bash_profile ~/.bash_profile
ln -nfs $XDG_CONFIG_HOME/bash/.bashrc ~/.bashrc
echo "Placed .bash_profile & .bashrc on '$HOME'"
ln -nfs $XDG_CONFIG_HOME/tmux/.tmux.conf ~/.tmux.conf

cd ~

cat << END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
SYMBOLIC LINKS ARE COMPLETED
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

END
