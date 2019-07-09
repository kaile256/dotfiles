#! /bin/bash

set -Ceu

formulae=(
  mysql
  sqlite
  xclip
  ricty
  w3m
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

### brew-others
brew install kotlin tig

cat << END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
HOMEBREW FORMULAE ARE INSTALLED
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

END

