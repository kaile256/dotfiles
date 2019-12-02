# From: fish/config.fish
# Ref: bash/alias.sh

alias tmux 'tmux -2'

alias l 'ls -la'
alias la 'ls -A'
alias ll 'ls -l'

alias ec 'echo'
alias ech 'echo'

alias pk '~/start-kail.sh'

alias pacman-mirrors-update 'sudo pacman-mirrors -f && sudo pacman -Syy'

alias rwatch 'cd ~/rustlings && rustlings watch'

# Fzf
# Note: fzf --bind to execute(cd {}) doesn't work; use 'accept' instead
alias fzf-fonts 'fc-list | fzf'

alias fzf-ghq "cd (ghq list --full-path | fzf --bind 'ctrl-v:execute(nvr {})')"
alias gz fzf-ghq
alias zg fzf-ghq

# for functions
alias zzh 'fzf-ssh'
alias Qq 'fzf-pacman-Qq'
alias qq 'fzf-pacman-Qq'
