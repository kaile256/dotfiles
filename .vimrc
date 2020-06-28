" This file is only for Vim not for Neovim

set rtp^=~/.config/nvim
runtime init.vim

imap <Cmd> <Esc>:
nmap <Cmd> :<C-u>

" set verbosefile=/tmp/vim-log
set clipboard=unnamed,unnamedplus
set backspace=indent,eol,start
set guicursor=n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20,a:blinkon0

let &t_SI = "\e[5 q" " Insert mode
let &t_SR = "\e[4 q" " Replace mode
let &t_me = "\e[1 q" " the Other mode

if exists('+termencoding')
  let &termencoding = &encoding
endif
