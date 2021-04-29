#!/usr/bin/env bash

Path=(
  #"/opt/brew/bin" # recommended to set before /bin
  #"/opt/brew/sbin" # recommended to set before /bin
  "$HOME/.local/bin" # local
  "$HOME/bin"
  "$CARGO_HOME/bin" # rust
  "$PYENV_ROOT/bin" # python
  "$HOME/.luarocks" # Lua
  "$HOME/.gem/ruby/3.0.0/bin" # ruby
  "$GOPATH/bin" # go
  "$HOME/.node_modules/bin" # nodejs
  "$HOME/.yarn/bin" # nodejs
)

appendpath () {
  # Ref: /etc/profile
  case ":$PATH:" in
    *:"$1":*)
      ;;
    *)
      PATH="${PATH:+$PATH:}$1"
  esac
}

for path in "${Path[@]}"; do
  appendpath "$path"
done

unset appendpath

export PATH
