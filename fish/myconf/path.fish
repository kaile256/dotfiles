#!/usr/bin/env fish

# Golang
set -x PATH "$GOPATH/bin" $PATH
# Python
set -x PATH "$PYENV_ROOT/bin $PATH"

set -x PATH "$HOME/.local/bin:$PATH"

# Rust
## Cargo
set -x PATH "$HOME/.cargo/bin:$PATH"
set -x PATH "$HOME/.local/share/cargo/env:$PATH"
set -x PATH "$HOME/.local/share/cargo/bin:$PATH"

# Ruby
# gem
set -x PATH "$HOME/.gem/2.6.0:$PATH"

# Nodejs
set -x PATH "$HOME/.node_modules/bin:$PATH"

# yarn
set -x PATH "$PATH:$HOME/.yarn/bin"
