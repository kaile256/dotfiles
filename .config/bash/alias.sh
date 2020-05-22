#!/usr/bin/env bash

# From: .bashrc
# Ref: fish/myconf/alias.fish

# Note: write XDG-related aliases in 'env.sh'

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
alias nvr="nvr -s --remote-wait-silent"
alias kvi="nvim -u $HOME/kaile256/dotfiles/nvim/init.vim"

alias pg='pgrep'

# App; Linux on Android
alias pk='~/start-kali.sh'

# TODO: accept arguments to restrict candidates
alias fzf-fonts='fc-list | fzf'

alias zg=ghq-cd
alias gz=ghq-cd

# Ref: https://qiita.com/yutakatay/items/f19b2a0a962a587db5cf
#alias nvim-how-slower=echo "scale=3; $(nvim --startuptime /tmp/stime_mine.log -c 'quit' > /dev/null && tail -n 1 /tmp/stime_mine.log | cut -d ' ' -f1) / $(nvim -u DEFAULTS --startuptime /tmp/stime_def.log -c 'quit' > /dev/null && tail -n 1 /tmp/stime_def.log | cut -d ' ' -f1)" | bc | xargs -i echo {}x slower your Vim than the default.
#alias vim-how-slower=echo "scale=3; $(vim --startuptime /tmp/stime_mine.log -c 'quit' > /dev/null && tail -n 1 /tmp/stime_mine.log | cut -d ' ' -f1) / $(vim -u DEFAULTS --startuptime /tmp/stime_def.log -c 'quit' > /dev/null && tail -n 1 /tmp/stime_def.log | cut -d ' ' -f1)" | bc | xargs -i echo {}x slower your Vim than the default.
