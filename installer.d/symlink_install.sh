#!/bin/bash

# $HOME
ln -sf ~/dotfiles/tag/.ctags $HOME/.ctags
ln -sf ~/dotfiles/tig/.tigrc $HOME/.tigrc

ln -sf ~/dotfiles/keymap ~/.w3m/keymap
ln -sf ~/dotfiles/nvim/init.vim ~/.vim/vimrc


# $XDG_CONFIG_HOME
ln -sf ~/dotfiles/nvim $XDG_CONFIG_HOME/nvim
ln -sf ~/dotfiles/tmux $XDG_CONFIG_HOME/tmux
ln -sf ~/dotfiles/fish $XDG_CONFIG_HOME/fish
ln -sf ~/dotfiles/bash $XDG_CONFIG_HOME/bash

