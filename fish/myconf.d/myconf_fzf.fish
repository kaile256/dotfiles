## Commands

## Variables
set -x FZF_LEGACY_KEYBINDINGS 0
set -x FZF_TMUX 1
# use ripgrep; see hidden files, too. ignore .git and so on. ignore obj. in gitignore. follow symLinks.
set -x FZF_DEFAULT_COMMAND 'rg --files --hidden --follow --glob "!.git/*"'

