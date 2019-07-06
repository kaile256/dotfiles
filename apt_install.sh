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

source 
