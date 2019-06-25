## Never write "exec tmux" on script, or never access the WSL Distribution.
#. expand(~/.config/fish/myconf.d/*.fish)
#. expand(~/.config/fish/myfuctions/*.fish)

umask 022

### PATH
set -g fish_user_paths "/home/linuxbrew/.linuxbrew/bin" $fish_user_paths
#set -x TMUX /home/linuxbrew/.linuxbrew/bin/tmux
set -x TERM screen-256colorstatus --is-interactive; and source (jump shell fish | psub)

