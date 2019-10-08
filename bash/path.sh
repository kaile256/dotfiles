#!/usr/bin/env bash

set -Cu

export PATH="$HOME/.local/bin:$PATH"

# Rust
## Cargo
if [ -d ~/.cargo ]; then
  export PATH="$HOME/.cargo/bin:$PATH"
else
  export PATH="$HOME/.local/share/cargo/env:$PATH"
  export PATH="$HOME/.local/share/cargo/bin:$PATH"
fi

# Python
## pyenv
export PATH="$HOME/.pyenv/bin:$PATH"

# Ruby
## gem
type ruby >> /dev/null && eval ruby --version | grep 2.6. >> /dev/null &&
  export PATH="$HOME/.gem/2.6.0:$PATH"

# Go
if [ ! -z $GOPATH ]; then
  export PATH="$GOPATH/bin:$PATH"
fi

## Nodejs
export PATH="$HOME/.node_modules/bin:$PATH"
## yarn
export PATH="$HOME/.yarn/bin:$PATH"
export PATH="$HOME/.config/yarn/global/node_modules/.bin:$PATH"
