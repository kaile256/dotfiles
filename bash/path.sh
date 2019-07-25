#!/usr/bin/env bash

set -Cu

#### From: .bashrc

export PATH="$HOME/.local/bin:$PATH"
#### LANGUAGE 
### Rust
## Cargo
export PATH="$HOME/.cargo/bin:$PATH"

### Python
## pyenv
export PATH="$HOME/.pyenv/bin:$PATH"


### Nodejs
## nodebrew
export PATH="$HOME/.nodebrew/current/bin:$PATH"
## yarn
#export PATH="$PATH:$HOME/`yarn global bin`"
