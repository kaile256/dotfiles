#!/usr/bin/env bash

# From: .bashrc
# Note: Write those alias for XDG Base Repository specification in 'env.sh'

set -Cu

# Command; ls
export 'LS_OPTION'='--color=auto'
alias ls="ls --color=auto"
alias la="ls --color=auto -A"
alias ll="ls --color=auto -l"
alias  l="ls --color=auto -lA"
# Command; echo
alias ec='echo'
alias ech='echo'

# App; Shell
alias f=fish
# App; Neovim
# `-s`: outputs no error even if no nvim server running.
alias nvr="nvr -s"
alias kvi="nvim -u $HOME/kaile256/dotfiles/nvim/init.vim"
# App; w3m
type w3m > /dev/null && alias w3m="w3m https://duckduckgo.com/?q="
# App; Linux on Android
alias pk='./pkali.sh'

# wget
alias wget="wget --hsts-file=$XDG_CACHE_HOME/wget-hsts"
### tmux
alias tmux="tmux -f $XDG_CONFIG_HOME/tmux/tmux.conf"
### dict
alias dict="dict -c $XDG_CONFIG_HOME/dict/dictrc"
### GnuPG
alias gpg2="gpg2 --homedir $XDG_DATA_HOME/gnupg"
### subversion
alias svn="svn --config-dir $XDG_CONFIG_HOME/subversion"
### weechat
alias weechat="weechat -d $XDG_CONFIG_HOME/weechat"
### xstart
alias startx="startx $XDG_CONFIG_HOME/X11/xinitrc -- $XDG_CONFIG_HOME/X11/xserverrc vt1"

