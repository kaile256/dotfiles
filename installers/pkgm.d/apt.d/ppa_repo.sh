#! /bin/bash

set -Ceu

echo "Add some apt-repositories..."
PPA_REPOS=(
  jonathonf/vim
#  mmstick76/alacritty
)

for repo in "${PPA_REPOS[@]}"; do
  sudo add-apt-repository ppa:${repo}
done

sudo apt update

for repo in '$PPA_REPOS[@]'; do
  echo "Done! Here comes the latest version of ${repo}"
  echo "Please install it manually!!"
  echo ""
done
