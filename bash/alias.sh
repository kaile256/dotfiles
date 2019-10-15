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
alias cz='cd $(ghq list | fzf)'

# App; Neovim
# `-s`: outputs no error even if no nvim server running.
alias nvr="nvr -s"
alias kvi="nvim -u $HOME/kaile256/dotfiles/nvim/init.vim"
# App; Linux on Android
alias pk='./start-kali.sh'
#alias rustlings='cd ~/rustlings && rustlings'
