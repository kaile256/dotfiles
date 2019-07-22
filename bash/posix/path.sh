#!/usr/bin/env bash
# Private bin located as you like
if [ -d "$HOME/bin" ] ; then
    export PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ; then
    export PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/.cargo/bin" ]; then
  export PATH="$HOME/.cargo/bin:$PATH"
else
  curl https://sh.rustup.rs -sSf | sh
  cargo install ripgrep
fi

if [ -d "$HOME/.pyenv/bin" ]; then
  export PATH="$HOME/.pyenv/bin:$PATH"
  eval "$(pyenv init -)"
  eval "$(pyenv virtual-init -)"
else
  curl https://pyenv.run | bash
  pyenv update
fi
