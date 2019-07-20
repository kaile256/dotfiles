#### Tmux Plugins

set -Ceu

# install tmux plugin manager
echo "installing tmux..."
ghq get https://github.com/tmux-plugins/tpm
ln -sfn $HOME/.ghq/github.com/tmux-plugins/tpm $XDG_CACHE_HOME/tmux/tpm/tpm
echo "Type C-Space & capital I to install tpm!"

#### Fisher Plugins
# tmux would start fish;
# then, script will automatically install fish plugin manager.
# TODO
sudo rm -rf /tmp/tmux-*
tmux

