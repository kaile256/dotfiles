" From: filetype.vim

setl fdm=marker fdl=0

noremap <buffer><silent> <S-TAB> :keepjumps keeppatterns %s/^\s\+//ge<cr> 

" Before Typo
inoreabbr <buffer> "{{{ #{{{
inoreabbr <buffer> "}}} #}}}
