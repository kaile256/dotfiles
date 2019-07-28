#!/usr/bin/env bash

#### TODO: redirect to pkgm.sh

#### INSTALLER IDENTIFICATION
Installer=(
pacman
apt
)
for i in ${Installer[@]}; do
  type $i >> /dev/null 2>&1 && export INSTALLER="$i"
  [[ $INSTALLER == $i ]] && echo "Installer is identified, $INSTALLER"
done

declare -A Install
Install=(
['pacman']='pacman -S'
['apt']='apt install'
)

export install="${Install[$INSTALLER]}"
echo "$INSTALLER will install package via $install"

#### WANTED-PACKAGES INSTALLATION
Package=(
anyenv
pyenv
python-pipenv
ruby
cargo
go
yarn
)

for j in ${Package[@]}; do
  type $j || { 
    echo "Installing $j..." && sudo $install $j 
  }
done
