## Commands

## Variables
set -x FZF_LEGACY_KEYBINDINGS 0
set -x FZF_TMUX 1
# use ripgrep; see hidden files, too. ignore .git and so on. ignore obj. in gitignore. follow symLinks.
set -x FZF_DEFAULT_COMMAND 'rg --files --hidden --follow --glob "!.git/*"'

## w/ ghq
#function ghq_fzf_repo -d 'Repository search'
#  ghq list --full-path | fzf --reverse --height=100% | read select
#  [ -n "$select" ]; and cd "$select"
#  echo " $select "
#  commandline -f repaint
#end
#
## keybind
#function fish_user_key_bindings
#  bind \cg ghq_fzf_repo
#end
