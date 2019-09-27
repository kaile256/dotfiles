" From: filetype.vim

setl fdm=marker fdl=0

nnoremap <buffer><silent> <c-=> :keeppatterns %s/^\s\+//ge<cr>
nnoremap <buffer><silent> g= :keeppatterns %s/^\s\+//ge<cr>

" Before Typo
inoreabbr <buffer> "{{{ #{{{
inoreabbr <buffer> "}}} #}}}
