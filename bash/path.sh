#!/usr/bin/env bash

set -Ceu

export PATH="$XDG_CONFIG_HOME/bash"

if [ -d ~/.pyenv/bin ];
  export PATH="$HOME/.pyenv/bin:$PATH"
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
else
  curl https://pyenv.run | bash
  exec -l bash
fi

if [ -d ~/.cargo/bin ]; then
  export PATH="$HOME/.cargo/bin:$PATH"
else
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  exec -l bash
fi
