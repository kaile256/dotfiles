" From: filetype.vim

setl fdm=marker fdl=0
nnoremap <buffer><expr> gg (getline(1) =~# 'scriptencoding utf-8')? ':2<cr>' : 'gg'
