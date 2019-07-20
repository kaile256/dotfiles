#! /bin/bash

set -Ceu

formulae=(
  mysql
  sqlite
  w3m
)

echo 'start brew install apps...'
for formula in '${formulae[@]}'; do
	brew install $formula || brew upgrade $formula
done

echo 'run brew cleanup...'
brew cleanup


### brew-others
brew install kotlin tig

cat << END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

HOMEBREW FORMULAE ARE INSTALLED

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

END
