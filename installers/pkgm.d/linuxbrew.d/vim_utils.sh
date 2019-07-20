#! /bin/bash

set -Ceu

formulae=(
  global
  xclip
  python
  pyenv
  rustup
  yarn
  ruby
  )

echo 'start brew install apps...'
for formula in ${formulae[@]}; do
  brew install $formula || brew upgrade $formula
done

echo 'run brew cleanup...'
brew cleanup

cat << END                                                                           

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
HOMEBREW FORMULAE ARE INSTALLED
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 

END                                                                                  

