#### Tmux Plugins
# install tmux plugin manager
ghq get https://github.com/tmux-plugins/tpm
ln -sfn $HOME/.ghq/github.com/tmux-plugins/tpm $XDG_CACHE_HOME/tmux/tpm/tpm
echo "Type C-Space & capital I to install tpm!"

#### Fisher Plugins
# tmux would start fish;
# then, script will automatically install fish plugin manager.
sudo rm -rf /tmp/tmux-*
tmux

#### Neovim Plugins
###  COC external LSP
## coc-php
npm i intelephense -g
## coc-ruby
gem install solargraph
## coc-rust
rustup-init
source $HOME/.cargo/env
rustup update
rustup component add rls rust-analysis rust-src
### CocInstall
:CocInstall coc-phplsp coc-solargraph coc-rls

#### Neovim-Linkage to Language
## ruby
gem install neovim
pip3 install neovim neovim-remote
#### tty
pip3 install alacrity
