" TOML: insert.toml
" Repo: mattn/vim-lexiv

inoremap <expr> ` lexiv#backquote_open()
inoremap <expr> " lexiv#quote_open('"')
inoremap <expr> ' lexiv#quote_open("'")
inoremap <expr> { lexiv#paren_open('{')
inoremap <expr> ( lexiv#paren_open('(')
inoremap <expr> [ lexiv#paren_open('[')

" inoremap <expr> } lexiv#paren_close('}')
" inoremap <expr> ) lexiv#paren_close(')')
" inoremap <expr> ] lexiv#paren_close(']')

inoremap <expr> <CR>  lexiv#paren_expand()
inoremap <expr> <c-j> lexiv#paren_expand()

" inoremap <expr> <BS> lexiv#paren_delete()
