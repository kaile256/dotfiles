unalias vi

alias svn='svn --config-dir "$XDG_CONFIG_HOME"/subversion'
alias tmux='tmux -f "$XDG_CONFIG_HOME"/tmux/tmux.conf'
alias wget='wget --hsts-file="$XDG_CACHE_HOME/wget-hsts'
alias startx='startx "$XDG_CONFIG_HOME/X11/xinitrc" -- vt1'
alias xrdb='xrdb -load ~/.config/X11/xresources'
alias sqlite3='sqlite3 -init "$XDG_CONFIG_HOME"/sqlite3/sqliterc'
