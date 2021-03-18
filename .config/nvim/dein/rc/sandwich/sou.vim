" From: operator.toml
" Repo: machakann/vim-sandwich
" Fork: kaile256/vim-sandwich

hi! OperatorSandwichAdd    cterm=reverse gui=reverse ctermfg=142 guifg=#b8bb26
hi! OperatorSandwichChange cterm=reverse gui=reverse ctermfg=108 guifg=#8ec07c
hi! OperatorSandwichDelete cterm=reverse gui=reverse ctermfg=167 guifg=#fb4934

let g:sandwich_no_default_key_mappings          = 1
let g:operator_sandwich_no_default_key_mappings = 1
let g:textobj_sandwich_no_default_key_mappings  = 1

let g:operator#sandwich#timeoutlen = 1500 " default: &timeoutlen (=1000ms).

let g:sandwich#magicchar#f#patterns = [{
      \   'header' : '\<\%(\h\k*\.\)*\h\k*',
      \   'bra'    : '(',
      \   'ket'    : ')',
      \   'footer' : '',
      \ }]

