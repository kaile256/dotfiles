#### Neovim Plugins
### COC
echo "install COC"
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
