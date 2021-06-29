#!/usr/bin/env bash

# vim
#if ! [ -d "XDG_DATA_HOME/vim/{undo,swap,backup}" ]; then
#  mkdir -p "$XDG_DATA_HOME/vim/{undo,swap,backup}"
#fi

# wine
if ! [ -d "$XDG_DATA_HOME/wineprefixes" ]; then
  mkdir -p "$XDG_DATA_HOME/wineprefixes"
fi

# Ruby
#if ! [ -z `cat /etc/gemrc | grep 'gem --user-install'` ]; then
#  export EDITOR=vi
#  sudoedit -c '%s/--usr-install//g'
#fi

# Shell
## bash
export HISTFILE="$XDG_DATA_HOME/bash/history"
export BASH_COMPLETION_USER_FILE="$XDG_CONFIG_HOME/bash-completion/bash_completion"
## zsh
# .zplugin is on $ZDOTDIR; cannot export $ZDOTDIR on .zplugin
export ZDOTDIR="${XDG_CONFIG_HOME}/zsh"
export HISTFILE="$XDG_DATA_HOME/zsh/history"


# Command
## wget
export WGETRC="$XDG_CONFIG_HOME/wgetrc"
## z
export _Z_DATA="$XDG_DATA_HOME/z"

# App
## vim
#export VIMINIT=":source $XDG_CONFIG_HOME/vim/vimrc"
## tmux
#export TMUX_TMPDIR="$XDG_RUNTIME_DIR"
## lessp
if ! [ -d "$HOME/.cache/less" ]; then
  mkdir -p "$HOME/.cache/less"
fi
export LESSKEY="$XDG_CONFIG_HOME/less/lesskey"
## MySQL
export MYSQL_HISTFILE="$XDG_DATA_HOME/mysql_history"
## docker
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
export MACHINE_STORAGE_PATH="$XDG_DATA_HOME/docker-machine"
## GnuPG
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
## AWS_CLI
export AWS_SHARED_CREDENTIALS_FILE="$XDG_CONFIG_HOME/aws/credentials"
export AWS_CONFIG_FILE="$XDG_CONFIG_HOME/aws/config"
## vagrant
export VAGRANT_HOME="$XDG_DATA_HOME/vagrant"
export VAGRANT_ALIAS_FILE="$XDG_DATA_HOME/vagrant/aliases"
## weechat
export WEECHAT_HOME="$XDG_CONFIG_HOME/weechat"
## wine
export WINEPREFIX="$XDG_DATA_HOME/wineprefixes/default"
## Android
export ANDROID_SDK_HOME="$XDG_CONFIG_HOME/android"
# lynx, the browser
export LYNX_CFG=~/.config/lynx/lynx.cfg

## ncurses
export TERMINFO="$XDG_DATA_HOME/terminfo"
export TERMINFO_DIRS="$XDG_DATA_HOME/terminfo:/usr/share/terminfo"
## x11
export XCOMPOSEFILE="$XDG_CONFIG_HOME/x11/xcompose"
export XCOMPOSECACHE="$XDG_CACHE_HOME/x11/xcompose"
export XINITRC="$XDG_CONFIG_HOME/x11/xinitrc"
export XSERVERRC="$XDG_CONFIG_HOME/x11/xserverrc"
## coreutils source $(dircolors "$XDG_CONFIG_HOME/dircolors)"
export LESSHISTFILE="$XDG_CACHE_HOME/less/history"
## urxvtd
#export RXVT_SOCKET="$XDG_RUNTIME_DIR/urxvtd"

## nuget -- .NET
export NUGET_PACKAGES="$XDG_CACHE_HOME/NuGetPackages"
## readline
export INPUTRC="$XDG_CONFIG_HOME/readline/inputrc"
# Node.js
export NODE_REPL_HISTORY="$XDG_DATA_HOME/node_repl_history"
## npm
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
