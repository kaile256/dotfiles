#! /bin/bash

set -Ceu

formulae=(
  git
  wget
  curl
  tree
  mysql
  sqlite
  ricty
)

echo 'start brew install apps...'
for formula in '${formulae[@]}'; do
	brew install $formula || brew upgrade $formula
done

echo 'run brew cleanup...'
brew cleanup

### brew-fish
brew install fish ghq fzf ripgrep
echo "/home/linuxbrew/.linuxbrew/bin/fish" > /etc/shells

### brew-coc;
# DONT brew install rust;
# rustup-init would install rust, rustc, etc., and setup path recommended.
brew install rustup

### brew-tmux;
# apm-server may help tmux-plugins show OS-battery-status.
brew install xclip

### brew-others
brew install kotlin tig

cat << END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
HOMEBREW FORMULAE ARE INSTALLED
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

END

