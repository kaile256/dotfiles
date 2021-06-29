#!/usr/bin/env fish

# Golang
set -x PATH "$GOPATH/bin" $PATH
# Python
set -x PATH "$PYENV_ROOT/bin $PATH"

set -x PATH "$HOME/.local/bin:$PATH"

# Rust
## Cargo
set -x PATH "$CARGO_HOME/bin:$PATH"

# Ruby
# gem
set -x PATH "$HOME/.gem/2.6.0/bin:$PATH"

# Nodejs
set -x PATH "$HOME/.node_modules/bin:$PATH"

# yarn
set -x PATH "$PATH:$HOME/.yarn/bin"
