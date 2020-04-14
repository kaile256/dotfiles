#!/usr/bin/env fish

set -x FZF_LEGACY_KEYBINDINGS 0
set -x FZF_TMUX 1
# use ripgrep; ignore obj. in gitignore. follow symbolic links.
set -x FZF_DEFAULT_COMMAND 'rg --files --hidden --follow --glob "!.git/*"'

# Note: '\e' to 'alt(=esc)-'; '\c' to 'ctrl-'

# Search every executable commands (just ready to execute it)
bind \cx\t '__fzf_complete'
bind \cxi  '__fzf_complete'

# Search previous commands
bind \cx\cp '__fzf_reverse_isearch'
bind \cxp   '__fzf_reverse_isearch'

# Fzf to file/dir (not to cd)
bind \cx\cf '__fzf_find_file'
bind \cxf   '__fzf_find_file'

# cd there, leaving previously inserted commands on prompt.
bind \cx\cd '__fzf_cd --hidden'
bind \cxd   '__fzf_cd --hidden'

# `__fzf_open` uses xdg-open
# `__fzf_open --editor` uses $EDITOR
bind \cx\cv '__fzf_open --editor'
bind \cxv   '__fzf_open --editor'

bind \cxq   '__ghq_repository_search'
bind \cx\cq '__ghq_repository_search'

if bind -M insert >/dev/null 2>/dev/null
    bind -M insert  \cx\t '__fzf_complete'
    bind -M insert  \cxi  '__fzf_complete'
    bind -M insert  \cx\cp '__fzf_reverse_isearch'
    bind -M insert  \cxp   '__fzf_reverse_isearch'

    bind -M insert  \cx\cf '__fzf_find_file'
    bind -M insert  \cxf   '__fzf_find_file'
    bind -M insert  \cx\cd '__fzf_cd --hidden'
    bind -M insert  \cxd   '__fzf_cd'

    bind -M insert \cxq   '__ghq_repository_search'
    bind -M insert \cx\cq '__ghq_repository_search'
    #bind -M insert  \cx\cv '__fzf_open --editor'
    #bind -M insert  \cxv   '__fzf_open --editor'

end
