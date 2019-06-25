#. expand(~/.config/fish/myconf.d/*.fish)
#. expand(~/.config/fish/myfuctions/*.fish)

set -x TMUX /home/linuxbrew/.linuxbrew/bin/tmux
set -g fish_user_paths /home/linuxbrew/.linuxbrew/sbin $fish_user_paths
set -x TERM screen-256color

## Never write "exec tmux" on script, or never access the WSL Distribution.

## Plugins; fzf
# cf. ~/.config/fish/conf.d/fzf.fish
## Plugins; ghq
# set -g GHQ_SELECTOR fzf # Default selector is fzf

## helps to let PATH for SDKMAN
## sdk help > /dev/null

# ## Config Plugins
# for plugins_fisher in ~/.config/fish/myconf.fish/*.fish
#     source $plugins_fisher
# end
umask 022
set -g fish_user_paths "/home/linuxbrew/.linuxbrew/bin" $fish_user_paths
status --is-interactive; and source (jump shell fish | psub)

