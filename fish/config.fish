## Never write "exec tmux" on script, or never access the WSL Distribution.
. ~/.config/fish/myconf.d/*.fish
. ~/.config/fish/myfuctions/*.fish

umask 022

### VAR
set -x EDITOR /home/linuxbrew/.linuxbrew/bin/nvim
set -x VISUAL /home/linuxbrew/.linuxbrew/bin/nvim
set -x TMUX   /home/linuxbrew/.linuxbrew/bin/tmux
set -gx HOMEBREW_TEMP ~/tmp
set -x TERM screen-256color

### PATH
set -g fish_user_paths "/home/linuxbrew/.linuxbrew/bin" $fish_user_paths
set -g fish_user_paths "/home/linuxbrew/.linuxbrew/sbin" $fish_user_paths
set -g fish_user_paths "/home/linuxbrew/.linuxbrew/bin/gem" $fish_user_paths
set -g MANPATH /home/linuxbrew/.linuxbrew/share/man $MANPATH
set -g INFOPATH /home/linuxbrew/.linuxbrew/share/info $INFOPATH
set -g TMUX_TMPDIR ~/.cache/tmp

### Install fisher, the plugin manager
if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end
