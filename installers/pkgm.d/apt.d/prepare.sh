#! /usr/bin/env bash
#

set -Ceu

echo "Updating and upgrading apt..."
sudo apt update
sudo apt upgrade
echo "Done!"

echo "Preparing linuxbrew..."
sudo apt install build-essential curl file git
echo "Done!"
echo ""

echo "Installing utilities..."
sudo apt install gdebi fonts-ricty-diminished
echo "Done!"
#sudo apt install x11-utils x11-xserver-utils dbus-x11

