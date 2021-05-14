#!/usr/bin/env bash

PREDECESSORS=(
)

SUCCESSORS=(
  #"/opt/brew/bin" # recommended to set before /bin
  #"/opt/brew/sbin" # recommended to set before /bin
  "$HOME/.local/bin" # local
  "$HOME/bin" # Some maintainers deploy here.
  "$HOME/.bin" # Scripts for mine.
  "$CARGO_HOME/bin" # rust
  "$PYENV_ROOT/bin" # python
  "$HOME/.luarocks" # Lua
  "$HOME/.gem/ruby/3.0.0/bin" # ruby
  "$GOPATH/bin" # go
  "$HOME/.node_modules/bin" # nodejs
  "$HOME/.yarn/bin" # nodejs
)

insert_path () {
  # Ref: /etc/profile
  case ":$PATH:" in
    *:"$1":*)
      ;;
    *)
      PATH="$1${PATH:+:$PATH}"
  esac
}

append_path () {
  # Ref: /etc/profile
  case ":$PATH:" in
    *:"$1":*)
      ;;
    *)
      PATH="${PATH:+$PATH:}$1"
  esac
}

for path in "${PREDECESSORS[@]}"; do
  insert_path "$path"
done

for path in "${SUCCESSORS[@]}"; do
  append_path "$path"
done

unset -f insert_path
unset -f append_path

export PATH
