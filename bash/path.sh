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
type ruby >> /dev/null && eval ruby --version | grep 2.6. >> /dev/null &&
export PATH="$HOME/.gem/2.6.0:$PATH"

### Nodejs
export PATH="$HOME/.node_modules/bin:$PATH"
## nodebrew
export PATH="$HOME/.nodebrew/current/bin:$PATH"
## yarn
type yarn >> /dev/null && export PATH="$PATH:$HOME/`yarn global bin`"
