#!/bin/bash

echo
echo 'updates.sh: "pacman -Syu"'
echo
sudo pacman -Syu

echo
echo 'updates.sh: "yay -Syu"'
echo
yay -Syu

echo
read -r -p "Press enter to close this window..."
