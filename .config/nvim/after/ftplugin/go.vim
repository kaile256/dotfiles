" From: filetype.vim

onoremap <buffer><expr> = (v:operator ==# '=')? ':!goimports -w expand('%:p')<cr>': '='
