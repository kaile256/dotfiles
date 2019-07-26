#!/usr/bin/env bash

set -Cu

#### Ref.: curl.sh

#### LANGUAGE
### Python
type python3 || {
  type pacman && {
  echo "Installing python3..."
  sudo pacman -Sy python3
}
type apt && {
  echo "Installing python3..."
  sudo apt install python3
}
}
## pip
type pip3 || {
  type pacman && {
  echo "Installing pip3..."
  sudo pacman -Sy pip3
}
type apt && {
  echo "Installing pip3..."
  sudo apt install pip3
}
}

### Go
type go || {
  type pacman && {
  echo "Installing go..."
  sudo pacman -Sy go
}
type apt && {
  echo "Installing go..."
  sudo apt install go
}
## ghq
type ghq || {
  echo "Installing ghq..."
  go get github.com/motemen/ghq
}
}

### Nodejs
## npm
#type npm || {
#  echo "Installing npm..."
#  sudo apt install npm
#  ## LSP
#  npm i -g bash-language-server
#}

## yarn
#type yarn || {
#  echo "Installing yarn..."
#  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
#  echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
#  echo "Update apt for yarn!"
#  sudo apt update && sudo apt install yarn
#  echo "Done! Yarn is Ready!!"
#  ## LSP
#  yarn add bash-language-server
#}
