#!/usr/bin/env bash
#### From: .bashrc

set -Cu

export PATH="$HOME/.local/bin:$PATH"
#### LANGUAGE 
### Rust
## Cargo
export PATH="$HOME/.cargo/bin:$PATH"

### Python
## pyenv
export PATH="$HOME/.pyenv/bin:$PATH"

### Ruby
## gem
test ruby && eval ruby --version | grep 2.6. ||
export PATH="$HOME/.gem/2.6.0"

### Nodejs
export PATH="$HOME/.node_modules/bin:$PATH"
## nodebrew
export PATH="$HOME/.nodebrew/current/bin:$PATH"
## yarn
#export PATH="$PATH:$HOME/`yarn global bin`"
