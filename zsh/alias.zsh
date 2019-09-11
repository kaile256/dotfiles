#!/usr/bin/env zsh

# From: .bashrc
# Note: Write those alias for XDG Base Repository specification in 'env.sh'

# Standard Command; ls {{{
export 'LS_OPTION'='--color=auto'
alias ls="ls --color=auto"
alias la="ls --color=auto -A"
alias ll="ls --color=auto -l"
alias  l="ls --color=auto -lA"
alias ec='echo'
alias ech='echo'
alias f='fish'
#}}}

# Neovim
# `-s`: outputs no error even if no nvim server running.
alias nvr="nvr -s"
alias kvi="nvim -u $HOME/kaile256/dotfiles/nvim/init.vim"

# w3m
type w3m > /dev/null && alias w3m="w3m https://duckduckgo.com/?q="
