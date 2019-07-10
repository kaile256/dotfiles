# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022
umask 002

#### ENVIROMENT VARIABLE
### Prompt
## Color
black="\[\033[0;90m\]"
red="\[\033[0;91m\]"
green="\[\033[0;92m\]"
yellow="\[\033[0;93m\]"
blue="\[\033[0;94m\]"
purple="\[\033[0;95m\]"
cyan="\[\033[0;96m\]"
white="\[\033[0;97m\]"

## Bold
bcyan="\[\033[1;96m\]"

## Dim color
dgreen="\[\033[0;32m\]"
dyellow="\[\033[0;33m\]"
dcyan="\[\033[0;36m\]"
dwhite="\[\033[0;37m\]"

## Info
user="\u"
hostname="\h"
shortPWD="\w"
gitBranch='$(__git_ps1)'

PS1="${red}${user} ${white}@ ${purple}${hostname} ${green}${shortPWD}${bcyan}${gitBranch} \n${white}\$${cyan} "

# Private bin located as you like
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

## Linuxbrew
LINUXBREW="/home/linuxbrew/.linuxbrew"
if [ -d ${LINUXBREW} ]; then
  PATH="${LINUXBREW}/bin:$PATH"
  PATH="${LINUXBREW}/sbin:$PATH"
  eval $(${LINUXBREW}/bin/brew shellenv)
fi

## Env
DISPLAY="localhost:0.0"


#### SOURCE
# .bashrc
if [ -n "$BASH_VERSION" ]; then
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

