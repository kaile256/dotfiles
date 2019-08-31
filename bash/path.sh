#!/usr/bin/env bash

# From: .bashrc
# After: env.sh

set -Cu

export PATH="$HOME/.local/bin:$PATH"
#### LANGUAGE 
### Rust
## Cargo
if [ -d ~/.cargo ]; then
  export PATH="$HOME/.cargo/bin:$PATH"
else
  export PATH="$HOME/.local/share/cargo/env:$PATH"
  export PATH="$HOME/.local/share/cargo/bin:$PATH"
fi

### Python
## pyenv
export PATH="$HOME/.pyenv/bin:$PATH"

### Ruby
## gem
type ruby >> /dev/null && eval ruby --version | grep 2.6. >> /dev/null &&
  export PATH="$HOME/.gem/2.6.0:$PATH"

### Go
if [ ! -z $GOPATH ]; then
  export PATH="$GOPATH/bin:$PATH"
fi

### Nodejs
export PATH="$HOME/.node_modules/bin:$PATH"
## nodebrew
export PATH="$HOME/.nodebrew/current/bin:$PATH"
## yarn
export PATH="$PATH:$HOME/.yarn/bin"
