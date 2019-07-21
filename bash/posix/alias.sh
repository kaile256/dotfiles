alias wget='wget --hsts-file="$XDG_CACHE_HOME/wget-hsts'

alias tmux='tmux -f "$XDG_CONFIG_HOME"/tmux/tmux.conf'
alias startx='startx "$XDG_CONFIG_HOME/X11/xinitrc" -- vt1'
alias xrdb='xrdb -load ~/.config/X11/xresources'
alias svn='svn --config-dir "$XDG_CONFIG_HOME"/subversion'
alias sqlite3='sqlite3 -init "$XDG_CONFIG_HOME"/sqlite3/sqliterc'
## FZF
alias fzr='rg --files --hidden --follow --glob "!.git/*"'
