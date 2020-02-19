" From: motion.toml
" Repo: machakann/vim-sandwich
" Fork: kaile256/vim-sandwich

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
" Keymap; into Operators "{{{1
" Mnemonic: Yield a pair of bans
nmap \y zv<Plug>(operator-sandwich-add)
nmap \Y zv<Plug>(operator-sandwich-add)iW
" Mnemonic: Dispose the bans
nmap \d zv<Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
nmap \D zv<Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)
" Mnemonic: Change the bans
nmap \c zv<Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
nmap \C zv<Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)

xmap \y <Plug>(operator-sandwich-add)
xmap \d <Plug>(operator-sandwich-delete)
xmap \c <Plug>(operator-sandwich-replace)

" Keymap; Text-Objects {{{1
" a text surrounded by a pair of braket or of the same characters as user input
" i.e., the text-obj followed by '(' is regarded to be surrounded by '(' and ')'
"omap <space>i <Plug>(textobj-sandwich-query-i)
"xmap <space>i <Plug>(textobj-sandwich-query-i)
"omap <space>a <Plug>(textobj-sandwich-query-a)
"xmap <space>a <Plug>(textobj-sandwich-query-a)

omap i* <Plug>(textobj-sandwich-query-i)*
xmap i* <Plug>(textobj-sandwich-query-i)*
omap a* <Plug>(textobj-sandwich-query-a)*
xmap a* <Plug>(textobj-sandwich-query-a)*

omap i\| <Plug>(textobj-sandwich-query-i)\|
xmap i\| <Plug>(textobj-sandwich-query-i)\|
omap a\| <Plug>(textobj-sandwich-query-a)\|
xmap a\| <Plug>(textobj-sandwich-query-a)\|

"" a text surrounded by a pair of literally the same characters as user input
"" i.e., the text-obj followed by '(' is regarded to be surrounded by '(' and '('
omap <space>i <Plug>(textobj-sandwich-literal-query-i)
xmap <space>i <Plug>(textobj-sandwich-literal-query-i)
omap <space>a <Plug>(textobj-sandwich-literal-query-a)
xmap <space>a <Plug>(textobj-sandwich-literal-query-a)
