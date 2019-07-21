#! /bin/bash

see -Ceu

#### Neovim Plugins
### COC
echo "install COC"
## coc-php
npm i intelephense -g
## coc-ruby:
# solargraph is a lsp client.
# vmail is a gmail client on vim.
gem install solargraph vmail
## coc-rust
source $HOME/.cargo/env
rustup update
rustup component add rls rust-analysis rust-src
echo "Done!"

#### Neovim-Linkage to Language
## ruby
echo "Installing neovim utiles..."
gem install neovim
pip3 install neovim neovim-remote
### CocInstall
nvim -c ":CocInstall coc-phplsp coc-solargraph coc-rls"
echo "Done!"
