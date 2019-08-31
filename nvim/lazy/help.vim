" From: init.vim

if exists('b:loaded_lazy_help')
  finish
endif
let b:loaded_lazy_help = 1

setl bt=quickfix buflisted nonumber signcolumn= nolist
norm zz
