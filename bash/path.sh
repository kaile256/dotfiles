#!/usr/bin/env bash

set -Ceu

export PATH="$HOME/.local/bin:$PATH"
#### LANGUAGE 
### Rust
## Cargo
export PATH="$HOME/.cargo/bin:$PATH"

### Python
## pyenv
export PATH="$HOME/.pyenv/bin:$PATH"

### Nodejs
## yarn
export PATH="$PATH:$HOME/`yarn global bin`"
