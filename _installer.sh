#!/bin/bash
#
# At first, ghq get https://github.com/kaile256/dotfiles
#
# CAUTION!!!
# Change Extension "~~.fish" to "~~.sh".

#### Initialize Linuxbrew
echo "installing kaile256's environment..."
## init-modify permissions
sudo chown kaile256:kaile256 -R /home/linuxbrew
ln -s /home/linuxbrew/.linuxbrew $HOME/.linuxbrew
sudo chmod -R u+x $HOME/.linuxbrew/bin
## init-install Linuxbrew
echo "initializing linuxbrew..."
sudo apt update
sudo apt upgrade
sudo apt install linuxbrew-wrapper gdebi lxpenel
brew cleanup

#### Have Linuxbrew Set up Linux-Environment
echo "setting up environment for Ubuntu1804..."

### brew-fish
brew install fish ghq fzf ripgrep
echo /home/linuxbrew/.linuxbrew/bin/fish > /etc/shells

### brew-neovim
brew install ruby python yarn pyenv

### brew-coc;
# DONT brew install rust;
# rustup-init would install rust, rustc, etc., and setup path recommended.
brew install rustup

### brew-tmux;
# apm-server may help tmux-plugins show OS-battery-status.
brew install tmux xclip screen apm-server
chmod -R 700 $HOME/.linuxbrew/bin/tmux
echo /home/linuxbrew/.linuxbrew/bin/tmux > /etc/shells

### brew-others
brew install kotlin tig
## browser
brew install chrome-cli

source 
