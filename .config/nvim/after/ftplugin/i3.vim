" From: filetype.vim

setl fdm=marker fdl=0

nnoremap <buffer><silent> == :keeppatterns %s/^\s\+//ge<cr>

" Before Typo
inoreabbr <buffer> "{{{ #{{{
inoreabbr <buffer> "}}} #}}}
