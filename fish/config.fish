## Never write "exec tmux" on script, or never access the WSL Distribution.
. ~/.config/fish/myconf.d/*.fish
. ~/.config/fish/myfuctions/*.fish

umask 022

### VAR
set -x EDITOR /home/linuxbrew/.linuxbrew/bin/nvim
set -x VISUAL /home/linuxbrew/.linuxbrew/bin/nvim
set -x TMUX /home/linuxbrew/.linuxbrew/bin/tmux
#set -x TMUX /home/linuxbrew/.linuxbrew/bin/tmux
#set -x TERM screen-256color

### PATH
set -g fish_user_paths "/home/linuxbrew/.linuxbrew/bin" $fish_user_paths
set -g fish_user_paths "/home/linuxbrew/.linuxbrew/sbin" $fish_user_paths
set -g fish_user_paths "/home/linuxbrew/.linuxbrew/bin/gem" $fish_user_paths
set -g MANPATH /home/linuxbrew/.linuxbrew/share/man $MANPATH
set -g INFOPATH /home/linuxbrew/.linuxbrew/share/info $INFOPATH
#set -g TMUX_TMPDIR ~/.cache/tmp
