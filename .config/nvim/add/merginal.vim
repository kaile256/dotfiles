" From: fugitive.toml
" Repo: idanarye/vim-merginal
" Fork: kaile256/vim-merginal
" Ref: add/twiggy.vim

"let g:merginal_windowWidth =
"let g:merginal_windowSize =
"let g:merginal_splitType = ''
"let g:merginal_logCommitCount =

command! -bar Gbranch :Merginal

nnoremap <silent> <a-y> :Gbranch<cr>
xnoremap <silent> <a-y> :Gbranch<cr>
