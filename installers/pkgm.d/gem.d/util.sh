#!/usr/bin/env bash

set -Ceu

APPS=(
  tmuxinator
  )

for app in ${APPS[@]}; do
  echo "Installing ${app}..."
  echo ""
  gem install ${app}
  echo "Done! ${app} was installed."
done
