" This file is only for vim original; not for neovim

set rtp^=~/.config/nvim
runtime init.vim

if has('gui_running') " not on ginit.vim, but .gvimrc.
  "set guioptions-=mbTRLrl
  set guioptions-=m
  set guioptions-=b
  set guioptions-=T
  set guioptions-=R
  set guioptions-=L
  set guioptions-=l
  set guioptions-=r
endif
