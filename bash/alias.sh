#!/usr/bin/env bash

# From: .bashrc
# Note: Write those alias for XDG Base Repository specification in 'env.sh'

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
alias pk='./start-kali.sh'

