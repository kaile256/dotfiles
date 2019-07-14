# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022
umask 002

## source shared config
POSIX_SHARE=$HOME/.config/share/posix
source ${POSIX_SHARE}/env.sh
source ${POSIX_SHARE}/alias.sh

#### ENVIROMENT VARIABLE
export HISTFILE="$XDG_DATA_HOME"/bash/history
# Private bin located as you like
if [ -d "$HOME/bin" ] ; then
    export PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ; then
    export PATH="$HOME/.local/bin:$PATH"
fi

### Env
export DISPLAY="localhost:0.0"
export TERM="xterm-256color"

## Tmux
export TMUX="$(which tmux)"
# location: tmuxinator's config
if [ -d ${XDG_CONFIG_HOME}/tmux/tmuxinator ]; then
  export TMUXINATOR_CONFIG="${XDG_CONFIG_HOME}/tmux/tmuxinator"
fi

## Vim/Neovim
vim="$(which vim)"
Nvim="$(which nvim)"
if [ -f "${Nvim}" ]; then
  export EDITOR="$Nvim"
  export VISUAL="$Nvim"
else
  export EDITOR="$vim"
  export VISUAL="$vim"
fi

### Linuxbrew
LINUXBREW="/home/linuxbrew/.linuxbrew"
if [ -d ${LINUXBREW} ]; then
  export PATH="${LINUXBREW}/bin:$PATH"
  export PATH="${LINUXBREW}/sbin:$PATH"
  eval $(${LINUXBREW}/bin/brew shellenv)
#  APPS=(
#  nvim
#  fish
#  tmux
#  )
#  for app in ${APPS[@]}; do
#    app_path="${LINUXBREW}/bin/${app}"
#    if [ -f ${app_path} ]; then
#      export PATH="${app_path}:$PATH"
#    fi
#  done
#
fi

#### SOURCE
# .bashrc
if [ -n "$BASH_VERSION" ]; then
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

