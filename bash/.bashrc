##### TMUX
#if which tmux > /dev/null 2>&1; then
#  # only when no session runs, start a new session.
#  test -z "$TMUX" && (tmux attach || tmux new-session)
#fi

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# If this is an xterm set the title to user@host:dir
#case "$TERM" in
#xterm*|rxvt*)
#    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
#    ;;
#*)
#    ;;
#esac

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

XDG_CONFIG_HOME=$HOME/.config
ALIAS=${XDG_CONFIG_HOME}/bash/alias.bash
if [ -f ${ALIAS} ]; then
    .  ${ALIAS} 
fi
PROMPT=${XDG_CONFIG_HOME}/bash/prompt.bash
if [ -f ${PROMPT} ]; then
  . ${PROMPT}
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi

# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
umask 002

alias wget='wget --hsts-file="$XDG_CACHE_HOME/wget-hsts'

alias tmux='tmux -f "$XDG_CONFIG_HOME"/tmux/tmux.conf'
alias startx='startx "$XDG_CONFIG_HOME/X11/xinitrc" -- vt1'
alias xrdb='xrdb -load ~/.config/X11/xresources'
alias svn='svn --config-dir "$XDG_CONFIG_HOME"/subversion'
alias sqlite3='sqlite3 -init "$XDG_CONFIG_HOME"/sqlite3/sqliterc'
## FZF
alias fzr='rg --files --hidden --follow --glob "!.git/*"'
## shared by posix compatible
## XDG Directory Specification
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

# Bash
export BASH_COMPLETION_USER_FILE="$XDG_CONFIG_HOME"/bash/bash-completion
# Less
export LESSHISTFILE="$XDG_CACHE_HOME"/less/history
export LESSKEY="$XDG_CONFIG_HOME"/less/lesskey
# Wget
export WGETRC="$XDG_CONFIG_HOME/wgetrc"
# Cargo
export CARGO_HOME="$XDG_DATA_HOME"/cargo

export MYSQL_HISTFILE="$XDG_DATA_HOME"/mysql_history
## Vim
export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history
export TIGRC_USER="$XDG_CONFIG_HOME"/tig/tigrc
export GEM_HOME="$XDG_DATA_HOME"/gem
export GEM_SPEC_CACHE="$XDG_CACHE_HOME"/gem
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
# TODO: prepare npmrc later on XDG Data Dir Specification
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export NVM_DIR="$XDG_DATA_HOME"/nvm
## X Server
export RXVT_SOCKET="$XDG_RUNTIME_DIR"/urxvtd
export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
# xinit
export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc
export XSERVERRC="$XDG_CONFIG_HOME"/X11/xserverrc
export SCREENRC="$XDG_CONFIG_HOME"/screen/screenrc
export TMUX_TMPDIR="$XDG_RUNTIME_DIR"
## ncurses:TERMINFO, TERMINFO_DIRS
export TERMINFO="$XDG_DATA_HOME"/terminfo
export TERMINFO_DIRS="$XDG_DATA_HOME"/terminfo:/usr/share/terminfo
## Wine: helps MS-win apps on Linux
if ! [ -d "$XDG_DATA_HOME"/wineprefixes ]; then
  mkdir -p "$XDG_DATA_HOME"/wineprefixes
fi
export WINEPREFIX="$XDG_DATA_HOME"/wineprefixes/default
#### SOURCE
# .bashrc
if [ -n "$BASH_VERSION" ]; then
    if [ -f "$HOME/.bashrc" ]; then
  . "$HOME/.bashrc"
    fi
fi

#### ENVIROMENT VARIABLE
# Private bin located as you like
if [ -d "$HOME/bin" ] ; then
    export PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ; then
    export PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/.cargo/bin" ]; then
  export PATH="$HOME/.cargo/bin:$PATH"
else
  curl https://sh.rustup.rs -sSf | sh
  cargo install ripgrep
fi

if [ -d "$HOME/.pyenv/bin" ]; then
  export PATH="$HOME/.pyenv/bin:$PATH"
  eval "$(pyenv init -)"
  eval "$(pyenv virtual-init -)"
else
  curl https://pyenv.run | bash
  pyenv update
fi
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

## Tags
if ! [ -z uname | grep LINUX ]; then
  export GTAGSCONF=/usr/share/gtags/gtags.conf
  export GTAGSCLABEL=new-ctags
fi
# regard .h-files as cpp-file.
export GTAGSFORCECPP=1

## Tmux
export TMUX="$(which tmux)"

## FZF

## For WSL
#export DISPLAY="localhost:0.0"

## PROMPT_GIT; Plugin PROMPT_GIT="${XDG_CACHE_HOME}/bash/repos/github.com/magicmonty/bash-git-prompt/gitprompt.sh"
if [ -e "${PROMPT_GIT}" ]; then
  GIT_PROMPT_ONLY_IN_REPO=1
  source "${PROMPT_GIT}"
fi

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
