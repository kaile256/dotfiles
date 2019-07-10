# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022
umask 002

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

#### ENVIROMENT VARIABLE
## Prompt
export red="\[\033[0;91m\]"
export green="\[\033[0;92m\]"
export cyan="\[\033[0;96m\]"
export yellow="\[\033[0;93m\]"
export white="\[\033[0;97m\]"

# dim colors
export dgreen="\[\033[0;32m\]"
export dyellow="\[\033[0;33m\]"
export dcyan="\[\033[0;36m\]"
export dwhite="\[\033[0;37m\]"

export user="\u"
export hostname="\h"
export shortPWD="\w"
export gitBranch='$(__git_ps1)'

#export PS1="\[\033[0;32m\]\[\033[0m\033[0;32m\]\u\[\033[0;36m\]@\[\033[0;36m\]\h \w\[\033[0;32m\]$(__git_ps1)\[\033[0;32m\]\$ "
export PS1="${red}${user} ${dwhite}@ ${green}${shortPWD}${cyan}${gitBranch}${white}\$${cyan} "

## Original Env
export DOTFILES="$HOME/.ghq/github.com/kaile256/dotfiles"
export LINUXBREW="/home/linuxbrew/.linuxbrew"

## Env
export DISPLAY="localhost:0.0"

## Path
export PATH="${LINUXBREW}/bin:$PATH"
export PATH="${LINUXBREW}/sbin:$PATH"

eval $(${LINUXBREW}/bin/brew shellenv)

