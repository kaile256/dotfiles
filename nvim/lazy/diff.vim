" From: init.vim
if exists('b:loaded_lazy_diff')
  finish
endif
let b:loaded_lazy_diff = 1

set diffopt=iwhite,vertical
setl wrap

if bufexists(bufname("*/.git/*"))
  " Todo: Make it work; still winbufnr~~ is ignored.
  exe winbufnr(bufnr("*/.git/*/")) . 'windo setl bt=quickfix'
endif
