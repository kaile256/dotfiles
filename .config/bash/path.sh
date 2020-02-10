#!/usr/bin/env bash

Path=(
  #"/opt/brew/bin" # recommended to set before /bin
  #"/opt/brew/sbin" # recommended to set before /bin
  "$XDG_CONFIG_HOME/bash/functions" # original functions in Bash
  "$HOME/.local/bin" # local
  "$HOME/bin"
  "$CARGO_HOME/bin" # rust
  "$PYENV_ROOT/bin" # python
  "$HOME/.gem/ruby/2.7.0/bin" # ruby
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
