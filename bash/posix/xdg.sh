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
