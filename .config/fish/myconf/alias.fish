# From: fish/config.fish
# Ref: bash/alias.sh

alias make 'make --jobs 8'
alias tmux 'tmux -2'

alias l 'ls -Alh'
alias la 'ls -A'
alias ll 'ls -lh'

alias ec 'echo'
alias ech 'echo'

alias cd.. 'cd ..'
alias cd. 'cd ..'
alias cd-  'cd -'

# cause an error
#alias cd/  'cd /'

#alias -  'cd -'
alias ...  'cd ../..'
alias .2  'cd ../..'
alias ....  'cd ../../..'
alias .3  'cd ../../..'

alias pg 'pgrep'

alias pk '~/start-kail.sh'

alias pacman-mirrors-update 'sudo pacman-mirrors -f && sudo pacman -Syy'

alias rwatch 'cd ~/rustlings && rustlings watch'

# Screenkey
alias screenkey-below-for-left-window 'screenkey -g 950x1000 -t 0.5 &'

# -s: silence 'no server found' message, still causes an error in terminal
alias nvr 'nvr -s'

# Fzf {{{1
# Note: fzf --bind to execute(cd {}) doesn't work; use 'accept' instead
alias fzf-ghq "cd (ghq list --full-path | fzf --bind 'ctrl-v:execute(nvr {})')"
alias gz fzf-ghq
alias zg fzf-ghq

# for functions
alias zzh 'fzf-ssh'
alias Qq 'fzf-pacman-Qq'
alias qq 'fzf-pacman-Qq'
