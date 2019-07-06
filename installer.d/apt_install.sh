#!/bin/bash
#
# At first, ghq get https://github.com/kaile256/dotfiles
#
# CAUTION!!!
# Change Extension "~~.fish" to "~~.sh".

sudo apt update
sudo apt upgrade
echo "initializing linuxbrew..."
sudo apt install build-essential curl file git
sudo apt install linuxbrew-wrapper gdebi lxpenel

echo "installing utilities..."
sudo apt install gdebi
sudo apt install x11-utils x11-xserver-utils dbus-x11

sudo add-apt-repository ppa:mmstich76/alacritty
sudo apt install alacritty
