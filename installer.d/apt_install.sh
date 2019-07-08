#!/bin/bash
#
# At first, ghq get https://github.com/kaile256/dotfiles
#
# CAUTION!!!
# Change Extension "~~.fish" to "~~.sh".

echo "Add some apt-repositories..."
sudo add-apt-repository ppa:mmstick76/alacritty
echo "Done!"

echo "Updating and upgrading apt..."
sudo apt update
sudo apt upgrade
echo "Done!"

echo "Installing linuxbrew..."
sudo apt install build-essential curl file git
sudo apt install linuxbrew-wrapper
echo "Done!"

echo "Installing utilities..."
sudo apt install gdebi
#sudo apt install x11-utils x11-xserver-utils dbus-x11

sudo apt install alacritty
echo "Done!"
