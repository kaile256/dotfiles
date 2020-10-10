" From: operator.toml
" Repo: machakann/vim-sandwich
" Fork: kaile256/vim-sandwich
" Another: add/sandwich.vim
" Another: post/sandwich.vim

hi! OperatorSandwichAdd    cterm=reverse gui=reverse ctermfg=142 guifg=#b8bb26
hi! OperatorSandwichChange cterm=reverse gui=reverse ctermfg=108 guifg=#8ec07c
hi! OperatorSandwichDelete cterm=reverse gui=reverse ctermfg=167 guifg=#fb4934

let g:sandwich_no_default_key_mappings          = 1
let g:operator_sandwich_no_default_key_mappings = 1
let g:textobj_sandwich_no_default_key_mappings  = 1

"let g:operator#sandwich#timeoutlen = 500 " default: &timeoutlen (=1000ms).

" Magic Characters {{{1
" Note: magicchar-f will work like a textobj, for example, `\df` will change
"   `foo(arg)` into `arg`.
" Note: magicchar-t works only on header, not on footer
" Note: b:sandwich_magicchar_f_patterns is also available

