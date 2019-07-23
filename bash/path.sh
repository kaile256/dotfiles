#!/usr/bin/env bash

set -Ceu

## Cargo -- rust
export PATH="$HOME/.cargo/bin:$PATH"
## Pyenv -- python
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
