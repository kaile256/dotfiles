" From: init.vim

if exists('b:loaded_lazy_i3')
  finish
endif
let b:loaded_lazy_i3 = 1

setl fdm=marker fdl=0

noremap <buffer><silent> <S-TAB> :keepjumps keeppatterns %s/^\s\+//ge<cr> 

" Before Typo
inoreabbr <buffer> "{{{ #{{{
inoreabbr <buffer> "}}} #}}}
