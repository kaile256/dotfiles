" From: appearance.toml
" Repo: wellle/context.vim

let g:context_add_mappings = 0

nnoremap <silent> <c-space><c-space> :<c-u>noh <bar> redraw! <bar> call context#update(1, 0)<cr>
nnoremap <silent> <c-space><space>   :<c-u>noh <bar> redraw! <bar> call context#update(1, 0)<cr>
nnoremap <silent> <c-e> <c-e>:call context#update(0, 0)<cr>
nnoremap <silent> <c-y> <c-y>:call context#update(0, 0)<cr>
nnoremap <silent> <c-u> <c-u>:call context#update(0, 0)<cr>
nnoremap <silent> <c-d> <c-d>:call context#update(0, 0)<cr>
nnoremap <silent> <c-f> <c-f>:call context#update(0, 0)<cr>
nnoremap <silent> <c-b> <c-b>:call context#update(0, 0)<cr>
nnoremap <silent> zz     zzzz:call context#update(0, 0)<cr>
nnoremap <silent> zt     ztzt:call context#update(0, 0)<cr>
nnoremap <silent> zb     zbzb:call context#update(0, 0)<cr>
