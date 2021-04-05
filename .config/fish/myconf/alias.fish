# From: fish/config.fish
# Ref: bash/alias.sh

# `balias` let us completion
alias make 'make --jobs 8'
alias tmux 'tmux -2'

balias b 'bash'

set -x LS_OPTION -F --color=auto
balias la 'ls $LS_OPTION -A'
balias ll 'ls $LS_OPTION -lh'
balias l  'ls $LS_OPTION -Alh'

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
balias pg 'ps aux | rg --color always'

balias pk '~/start-kail.sh'

balias pacman-mirrors-update 'sudo pacman-mirrors -f -t 2 && sudo pacman -Syy'

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

# FIXME: make them work even with $EDITOR contains some arguments to connect
# remote server like `vim --remote-wait-silent`
alias e   '$EDITOR'
alias sp  '$EDITOR -o'
alias vs  '$EDITOR -O'
alias tabe '$EDITOR -p'

# Docker {{{1
balias d 'docker'
balias dk 'docker'
balias dcm 'docker-compose'

balias db 'docker build'
balias ds 'docker start'
balias dr 'docker restart'
balias da 'docker attach'

balias dps 'docker ps'
balias drm 'docker rm'

balias di   'docker image'
balias dim  'docker image'
balias dis  'docker images'
balias dims 'docker images'
balias drmi 'docker rmi'

# Git #{{{1
alias g git
alias gull 'git pull'
alias gush 'git push'
