#!/usr/bin/env fish

## XDG Directory Specification
set -x XDG_CONFIG_HOME $HOME/.config
set -x XDG_CACHE_HOME $HOME/.cache
set -x XDG_DATA_HOME $HOME/.local/share

# Bash
set -x BASH_COMPLETION_USER_FILE "$XDG_CONFIG_HOME"/bash/bash-completion
# Less
set -x LESSHISTFILE "$XDG_CACHE_HOME"/less/history
set -x LESSKEY "$XDG_CONFIG_HOME"/less/lesskey
# Wget
set -x WGETRC "$XDG_CONFIG_HOME/wgetrc"

# lynx, the browser
set -x LYNX_CFG ~/.config/lynx/lynx.cfg
# SQL
set -x MYSQL_HISTFILE "$XDG_DATA_HOME"/mysql_history
## Vim
set -x NODE_REPL_HISTORY "$XDG_DATA_HOME"/node_repl_history
set -x TIGRC_USER "$XDG_CONFIG_HOME"/tig/tigrc
set -x GEM_HOME "$XDG_DATA_HOME"/gem
set -x GEM_SPEC_CACHE "$XDG_CACHE_HOME"/gem
set -x RUSTUP_HOME "$XDG_DATA_HOME"/rustup
# TODO: prepare npmrc later on XDG Data Dir Specification
set -x NPM_CONFIG_USERCONFIG $XDG_CONFIG_HOME/npm/npmrc
set -x NVM_DIR "$XDG_DATA_HOME"/nvm
## X Server
#set -x RXVT_SOCKET "$XDG_RUNTIME_DIR"/urxvtd
#set -x XAUTHORITY "$XDG_RUNTIME_DIR"/Xauthority
# xinit
set -x XINITRC "$XDG_CONFIG_HOME"/X11/xinitrc
set -x XSERVERRC "$XDG_CONFIG_HOME"/X11/xserverrc
set -x SCREENRC "$XDG_CONFIG_HOME"/screen/screenrc
#set -x TMUX_TMPDIR "$XDG_RUNTIME_DIR"
## ncurses:TERMINFO, TERMINFO_DIRS
set -x TERMINFO "$XDG_DATA_HOME"/terminfo
set -x TERMINFO_DIRS "$XDG_DATA_HOME"/terminfo:/usr/share/terminfo
## Wine: helps MS-win apps on Linux
if ! [ -d "$XDG_DATA_HOME"/wineprefixes ]; then
  mkdir -p "$XDG_DATA_HOME"/wineprefixes
end
set -x WINEPREFIX "$XDG_DATA_HOME"/wineprefixes/default
