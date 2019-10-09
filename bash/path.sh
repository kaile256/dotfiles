#!/usr/bin/env bash

export PATH="$HOME/.local/bin:$PATH"

# Rust
## Cargo
export PATH="$CARGO_HOME/bin:$PATH"

# Python
## pyenv
export PATH="$PYENV_ROOT/bin:$PATH"

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
