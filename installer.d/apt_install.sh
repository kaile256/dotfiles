#!/bin/bash
#
# At first, ghq get https://github.com/kaile256/dotfiles
#
# CAUTION!!!
# Change Extension "~~.fish" to "~~.sh".

set -Ceu


echo "Updating and upgrading apt..."
sudo apt update
sudo apt upgrade
echo "Done!"

echo "Preparing linuxbrew..."
sudo apt install build-essential curl file git
echo "Done!"

echo "Installing utilities..."
sudo apt install gdebi
#sudo apt install x11-utils x11-xserver-utils dbus-x11

