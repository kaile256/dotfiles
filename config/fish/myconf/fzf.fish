#!/usr/bin/env fish

set -x FZF_LEGACY_KEYBINDINGS 0
set -x FZF_TMUX 1
# use ripgrep; ignore obj. in gitignore. follow symbolic links.
set -x FZF_DEFAULT_COMMAND 'rg --files --hidden --follow --glob "!.git/*"'
