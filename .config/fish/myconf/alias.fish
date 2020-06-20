# From: fish/config.fish
# Ref: bash/alias.sh

# `balias` let us completion
alias make 'make --jobs 8'
alias tmux 'tmux -2'

balias b 'bash'

balias l 'ls -Alh'
balias la 'ls -A'
balias ll 'ls -lh'

balias ec 'echo'
balias ech 'echo'

balias cd.. 'cd ..'
balias cd. 'cd ..'
balias cd-  'cd -'

# cause an error
#balias cd/  'cd /'

#balias -  'cd -'
balias ...  'cd ../..'
balias .2  'cd ../..'
balias ....  'cd ../../..'
balias .3  'cd ../../..'

#balias pg 'pgrep'
balias pg 'ps aux | grep'

balias pk '~/start-kail.sh'

balias pacman-mirrors-update 'sudo pacman-mirrors -f && sudo pacman -Syy'

balias rwatch 'cd ~/rustlings && rustlings watch'

# Screenkey
balias screenkey-below-for-left-window 'screenkey -g 950x1000 -t 0.5 &'

# -s: silence 'no server found' message, still causes an error in terminal
# `balias` causes complete recursively.
alias nvr 'nvr -s --remote-wait-silent'

# Fzf {{{1
# Note: fzf --bind to execute(cd {}) doesn't work; use 'accept' instead
#balias fzf-ghq "cd (ghq list --full-path | fzf --bind 'ctrl-v:execute(nvr {})')"
balias gz "bass source ghq-cd"
balias zg "bass source ghq-cd"

# for functions
balias zzh 'fzf-ssh'
balias Qq 'fzf-pacman-Qq'
balias qq 'fzf-pacman-Qq'
