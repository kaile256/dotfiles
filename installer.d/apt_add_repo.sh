#! /bin/bash

set -Ceu

echo "Add some apt-repositories..."
sudo add-apt-repository ppa:mmstick76/alacritty
echo "Done!"
sudo apt install alacritty
echo "Done!"
