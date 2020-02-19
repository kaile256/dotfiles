" From: motion.toml
" Repo: machakann/vim-sandwich
" Fork: kaile256/vim-sandwich
" Another: add/sandwich.vim

let g:sandwich_no_default_key_mappings          = 1
let g:operator_sandwich_no_default_key_mappings = 1
let g:textobj_sandwich_no_default_key_mappings  = 1

"let g:operator#sandwich#timeoutlen = 500 " default: &timeoutlen (=1000ms).

" Let; Magic Characters {{{1
" Note: b:g:sandwich#magicchar#f#patterns is also available
"let g:sandwich#magicchar#f#patterns = [{
"      \ 'filetype': ['vim'],
"      \ 'header' : '\<\h\k*',
"      \ 'f'    : "function! `expand('%') =~ 'autoload' ?
"      \   substitute(matchstr(expand('%:p'),'autoload/\zs.*\ze.vim'),'[/\\]','#','g').'#' : ''`
"      \   () abort",
"      \ 'F'    : 'endfunction',
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
