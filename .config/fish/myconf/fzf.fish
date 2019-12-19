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

bind \cx\t '__fzf_complete'
bind \cxi  '__fzf_complete'

# Mnemonic: Edit it
bind \cx\cv '__fzf_open --editor'
bind \cxv   '__fzf_open --editor'

# Note: unavailable in vim's terminal
bind \cxr '__fzf_reverse_isearch'

bind \cxq   '__ghq_repository_search'
bind \cx\cq '__ghq_repository_search'


if bind -M insert >/dev/null 2>/dev/null
    bind -M insert  \cx\cf '__fzf_find_file'
    bind -M insert  \cxf   '__fzf_find_file'
    # Mnemonic: Search
    bind -M insert  \cx\cp '__fzf_reverse_isearch'
    bind -M insert  \cxp   '__fzf_reverse_isearch'
    #bind -M insert  \cc '__fzf_cd'
    # Mnemonic: Cd
    bind -M insert  \cx\cd '__fzf_cd --hidden'
    bind -M insert  \cxd   '__fzf_cd --hidden'

    bind -M insert  \cx\t '__fzf_complete'
    bind -M insert  \cxi  '__fzf_complete'

    # Mnemonic: Edit it
    bind -M insert  \cx\cv '__fzf_open --editor'
    bind -M insert  \cxv   '__fzf_open --editor'

    # Note: unavailable in vim's terminal
    bind -M insert  \cxr '__fzf_reverse_isearch'

    bind -M insert \cxq   '__ghq_repository_search'
    bind -M insert \cx\cq '__ghq_repository_search'
end
