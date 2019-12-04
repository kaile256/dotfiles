#!/usr/bin/env fish

set -x FZF_LEGACY_KEYBINDINGS 0
set -x FZF_TMUX 1
# use ripgrep; ignore obj. in gitignore. follow symbolic links.
set -x FZF_DEFAULT_COMMAND 'rg --files --hidden --follow --glob "!.git/*"'

# '\e' to 'alt(=esc)-'; '\c' to 'ctrl-'
bind \cx\cf '__fzf_find_file'
bind \cxf   '__fzf_find_file'
# Mnemonic: Search
bind \cx\cp '__fzf_reverse_isearch'
bind \cxp   '__fzf_reverse_isearch'
#bind \cc '__fzf_cd'
# Mnemonic: Cd
bind \cx\cd '__fzf_cd --hidden'
bind \cxd   '__fzf_cd --hidden'

# Mnemonic: Edit it
bind \cx\cv '__fzf_open --editor'
bind \cxv   '__fzf_open --editor'

if bind -M insert >/dev/null 2>/dev/null
  bind -M insert \co '__fzf_find_file'
  bind -M insert \es '__fzf_reverse_isearch'
  #bind -M insert \ec '__fzf_cd'
  bind -M insert \ec '__fzf_cd --hidden'
  #bind -M insert \ev '__fzf_open'
  bind -M insert \ev '__fzf_open --editor'
end

bind \cg '__ghq_repository_search'
if bind -M insert >/dev/null 2>/dev/null
  bind -M insert \cg '__ghq_repository_search'
end

#if set -q FZF_COMPLETE
#  # seems same as find_file
#  bind \t '__fzf_complete'
#  if bind -M insert >/dev/null 2>/dev/null
#    bind -M insert \t '__fzf_complete'
#end
#end


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
