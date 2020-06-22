" From: operator.toml
" Repo: machakann/vim-sandwich
" Fork: kaile256/vim-sandwich
" Another: add/sandwich.vim

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

" let g:sandwich#magicchar#f#patterns = [{
"      \ 'header' : '\<\h\k*',
"      \ 'bra'    : '(',
"      \ 'ket'    : ')',
"      \ 'footer' : '',
"      \ }]

"" Let; Recipes of sandwich {{{1
"" Note: b:sandwich_recipes is also available
"let g:sandwich#recipes = [{
"      \ 'input': ['>'],
"      \ 'buns': ['<', '>'],
"      \ 'kind': ['add', 'replace'],
"      \ 'action': ['add'],
"      \ 'match_syntax': 1,
"      \ 'nesting': 1,
"      \ }, {
"      \ 'input':  ['}'],
"      \ 'buns': ['{\s*', '\s*}'],
"      \ 'kind': ['delete', 'replace', 'textobj'],
"      \ 'action': ['delete'],
"      \ 'match_syntax': 1,
"      \ 'nesting': 1,
"      \ 'regex': 1,
"      \ }, {
"      \ 'filetype': ['html'],
"      \ 'input': ['t'],
"      \ 'buns': ['TagInput(1)', 'TagInput(0)'],
"      \ 'kind': ['add', 'replace'],
"      \ 'action': ['add'],
"      \ 'expr': 1,
"      \ }]
"
