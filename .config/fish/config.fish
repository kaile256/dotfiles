#!/usr/bin/env fish

# Never write "exec tmux" on script, or never access the WSL Distribution.

# Note: CANNOT use * for sourcing.
#source fish/myconf.d/*.fish
#source fish/myfuctions/*.fish

# Note: too slow to use for-loop.
#for myconf_file in $HOME/.config/fish/myconf/*.fish
#    source $myconf_file
#end

source $HOME/.config/fish/myconf/prompt.fish

source $HOME/.config/fish/myconf/alias.fish
#source $HOME/.config/fish/myconf/env.fish
#source $HOME/.config/fish/myconf/path.fish

source $HOME/.config/fish/myconf/fzf.fish

umask 022

# VAR
#set -x EDITOR /home/linuxbrew/.linuxbrew/bin/nvim
#set -x VISUAL /home/linuxbrew/.linuxbrew/bin/nvim
#set -x TMUX   /home/linuxbrew/.linuxbrew/bin/tmux
#set -x TERM screen-256color
#set -x WWW_HOME https://duckduckgo.com/

# PATH
#set -g fish_user_paths "/home/linuxbrew/.linuxbrew/bin" $fish_user_paths
#set -g fish_user_paths "/home/linuxbrew/.linuxbrew/sbin" $fish_user_paths
#set -g fish_user_paths "/home/linuxbrew/.linuxbrew/bin/gem" $fish_user_paths
#set -g MANPATH /home/linuxbrew/.linuxbrew/share/man $MANPATH
#set -g INFOPATH /home/linuxbrew/.linuxbrew/share/info $INFOPATH
#set -gx HOMEBREW_TEMP ~/tmp
#set -g TMUX_TMPDIR ~/.cache/tmp

# Install fisher, the plugin manager
if not functions -q fisher
  set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
  curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
  fish -c fisher
end
