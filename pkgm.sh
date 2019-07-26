#!/usr/bin/env bash

#### Ref.: curl.sh

set -Cu

#declare -A Installer
#Installer[pacman]="pacman -S "
#Installer[apt]="apt install "
#
#### Identify Suitable Installer
#for installer in "${Installer[@]}"; do
#  type ${installer} && export INSTALLER=${!installer[*]}
#done
#
#Language=(
#go
#nodejs
#python3
#ruby
#rust
#)
#
#Installed=(
#cargo
#gem
#pip3
#yarn
#)
#
#for language in "${Language[@]}"; do
#  echo "Installing ${language}..."
#  `sudo $INSTALLER $langage`
#done
#
#for installed in "${Installed[@]}"; do
#  echo "Installing ${installed}..."
#  `sudo $INSTALLER $installed`
#done

#### LANGUAGE
### Python
type python3 || {
  echo "Installing python3..."
  type pacman && {
    sudo pacman -S python3
  } || {
    type apt && {
    sudo apt install python3
  }
}
}
## pip
type pip3 || {
  echo "Installing pip3..."
  type pacman && {
    sudo pacman -S pip3
  } || {
    type apt && {
    sudo apt install pip3
  }
}
}

### Ruby || {
type ruby || {
  echo "Installing ruby..."
  type pacman && {
    sudo pacman -S ruby
  } || {
    type apt && {
    sudo apt install ruby
  }
}
}

### Go
type go || {
  type pacman && {
  echo "Installing go..."
  sudo pacman -S go
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
type yarn || {
  #type apt && {
  #  echo "Installing yarn..."
  #  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
  #  echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
  #  echo "Update apt for yarn!"
  #  sudo apt update && sudo apt install yarn
  #  echo "Done! Yarn is Ready!!"
  #}
  type pacman && {
    echo "Installing yarn..."
      sudo pacman -S yarn
    }

# Neovim
yarn global add neovim
# LSP
yarn global add bash-language-server
}
}
