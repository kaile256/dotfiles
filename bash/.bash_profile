# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022
umask 002

#### ENVIROMENT VARIABLE
### Prompt
## Color
export   black="\[\033[0;90m\]"
export     red="\[\033[0;91m\]"
export   green="\[\033[0;92m\]"
export  yellow="\[\033[0;93m\]"
export    blue="\[\033[0;94m\]"
export  purple="\[\033[0;95m\]"
export    cyan="\[\033[0;96m\]"
export   white="\[\033[0;97m\]"

## Bold
export   bcyan="\[\033[1;96m\]"

## Dim color
export  dgreen="\[\033[0;32m\]"
export dyellow="\[\033[0;33m\]"
export   dcyan="\[\033[0;36m\]"
export  dwhite="\[\033[0;37m\]"

## Info
export      user="\u"
export  hostname="\h"
export  shortPWD="\w"
export gitBranch='$(__git_ps1)'

## Prompt Form
export PS1="\[\033[0;91m\]\u \[\033[0;97m\]@ \[\033[0;95m\]\h \[\033[0;92m\]\W\[\033[0;96m\] $(__git_ps1)  \n\[\033[0;97m\]\$\[\033[0;96m\] "
#export PS1="${red}${user} ${white}@ ${purple}${hostname} ${green}${shortPWD}${cyan}${gitBranch} \n${white}\$${cyan} "

# Private bin located as you like
if [ -d "$HOME/bin" ] ; then
    export PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ; then
    export PATH="$HOME/.local/bin:$PATH"
fi

### Linuxbrew
LINUXBREW="/home/linuxbrew/.linuxbrew"
if [ -d ${LINUXBREW} ]; then
  export PATH="${LINUXBREW}/bin:$PATH"
  export PATH="${LINUXBREW}/sbin:$PATH"
  eval $(${LINUXBREW}/bin/brew shellenv)
fi

APPS=(
  nvim
  fish
  tmux
)
for app in ${APPS[@]}; do
  app_path="${LINUXBREW}/bin/${app}"
  if [ -f ${app_path} ]; then
    export PATH="${app_path}:$PATH"
  fi
done

### Env
export DISPLAY="localhost:0.0"
export TERM="xterm-256color"

## Tmux
tmux="${LINUXBREW}/bin/tmux"
if [ -f "${tmux}" ]; then
  export TMUX="$tmux"
else
  export TMUX="/usr/bin/tmux"
fi

# location: tmuxinator's config
if [ -d ${XDG_CONFIG_HOME}/tmux/tmuxinator ]; then
  export TMUXINATOR_CONFIG="${XDG_CONFIG_HOME}/tmux/tmuxinator"
fi

## Vim/Neovim
vim="/usr/bin/vim"
Nvim="${LINUXBREW}/bin/nvim"
if [ -f "${Nvim}" ]; then
  export EDITOR="$Nvim"
  export VISUAL="$Nvim"
else
  export EDITOR="$vim"
  export VISUAL="$vim"
fi

#### SOURCE
# .bashrc
if [ -n "$BASH_VERSION" ]; then
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

