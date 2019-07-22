#!/usr/bin/env bash
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
ALIAS=${XDG_CONFIG_HOME}/bash/alias.sh
if [ -f ${ALIAS} ]; then
    .  ${ALIAS} 
fi
PROMPT=${XDG_CONFIG_HOME}/bash/prompt.sh
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
