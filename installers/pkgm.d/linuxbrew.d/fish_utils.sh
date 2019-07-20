#! /bin/bash

set -Ceu

formulae=(
  fish
  ghq
  fzf
  ripgrep
)

echo 'start brew install apps...'
for formula in '${formulae[@]}'; do
	brew install $formula || brew upgrade $formula
done

echo 'run brew cleanup...'
brew cleanup

### brew-fish
echo "/home/linuxbrew/.linuxbrew/bin/fish" > /etc/shells

cat << END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
HOMEBREW FORMULAE ARE INSTALLED
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

END

