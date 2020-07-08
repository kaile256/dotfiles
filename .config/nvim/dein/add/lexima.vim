" TOML: insert.toml
" Repo: cohama/lexima.vim
" Another: source/lexima.vim
" Another: post/lexima.vim

inoremap <silent><expr> " lexima#expand('"', 'i')
inoremap <silent><expr> ' lexima#expand("'", 'i')
inoremap <silent><expr> ` lexima#expand('`', 'i')

inoremap <silent><expr> ( lexima#expand('(', 'i')
inoremap <silent><expr> [ lexima#expand('[', 'i')
inoremap <silent><expr> { lexima#expand('{', 'i')

" inoremap <expr> ) lexima#expand(')',  'i')
" inoremap <expr> ] lexima#expand(']',  'i')
" inoremap <expr> } lexima#expand('}',  'i')

" inoremap <expr> <BS>    lexima#expand('<BS>',    'i')
"
" inoremap <expr> <space> lexima#expand('<space>', 'i')

" inoremap <expr> <Esc>   <C-r>=lexima#insmode#escape()<CR><Esc>

" inoremap <expr> <CR>  pumvisible() ? "\<C-Y>" : lexima#expand('<CR>',  'i')
" inoremap <expr> <C-j> pumvisible() ? "\<C-Y>" : lexima#expand('<C-j>', 'i')
