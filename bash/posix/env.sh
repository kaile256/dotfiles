#### ENVIROMENT VARIABLE
export HISTFILE="$XDG_DATA_HOME"/bash/history
export TERM=xterm-256color
## Vim/Neovim
vi="$(which vi)"
Nvim="$(which nvim)"
if [ -f "${Nvim}" ]; then
  export EDITOR="$Nvim"
  export VISUAL="$Nvim"
else
  export EDITOR="$vi"
  export VISUAL="$vi"
fi

## Gtags
# regard .h-files as cpp-file.
export GTAGSFORCECPP=1

## Tmux
export TMUX="$(which tmux)"

## For WSL
#export DISPLAY="localhost:0.0"

### Linuxbrew; for non-rolling releases.
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

