" From: motion.toml
" Repo: machakann/vim-sandwich

let g:sandwich_no_default_key_mappings = 1
let g:operator_sandwich_no_default_key_mappings = 1
let g:textobj_sandwich_no_default_key_mappings = 1

"" Let; Recipes of sandwich {{{1
"let g:sandwich#recipes = [
"      \   {'buns': ['<', '>'], 'nesting': 1, 'match_syntax': 1,
"      \    'kind': ['add', 'replace'], 'action': ['add'], 'input': ['<t_>']},
"      \
"      \   {'buns': ['< ', ' >'], 'nesting': 1, 'match_syntax': 1,
"      \    'kind': ['add', 'replace'], 'action': ['add'], 'input': ['>']},
"      \
"      \   {'buns': ['{ ', ' }'], 'nesting': 1, 'match_syntax': 1,
"      \    'kind': ['add', 'replace'], 'action': ['add'], 'input': ['{']},
"      \
"      \   {'buns': ['[ ', ' ]'], 'nesting': 1, 'match_syntax': 1,
"      \    'kind': ['add', 'replace'], 'action': ['add'], 'input': ['[']},
"      \
"      \   {'buns': ['( ', ' )'], 'nesting': 1, 'match_syntax': 1,
"      \    'kind': ['add', 'replace'], 'action': ['add'], 'input': ['(']},
"      \
"      \   {'buns': ['{\s*', '\s*}'],   'nesting': 1, 'regex': 1,
"      \    'match_syntax': 1, 'kind': ['delete', 'replace', 'textobj'],
"      \    'action': ['delete'], 'input': ['{']},
"      \
"      \   {'buns': ['\[\s*', '\s*\]'], 'nesting': 1, 'regex': 1,
"      \    'match_syntax': 1, 'kind': ['delete', 'replace', 'textobj'],
"      \    'action': ['delete'], 'input': ['[']},
"      \
"      \   {'buns': ['(\s*', '\s*)'],   'nesting': 1, 'regex': 1,
"      \    'match_syntax': 1, 'kind': ['delete', 'replace', 'textobj'],
"      \    'action': ['delete'], 'input': ['(']},
"      \ ]

" Keymap; into Operators "{{{1
" Mnemonic: Yield a pair of bans
nmap \y zv<Plug>(operator-sandwich-add)
" Mnemonic: Dispose the bans
nmap \d zv<Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
" Mnemonic: Change the bans
nmap \c zv<Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)

xmap \y <Plug>(operator-sandwich-add)
xmap \d <Plug>(operator-sandwich-delete)
xmap \c <Plug>(operator-sandwich-replace)

" Keymap; Text-Objects {{{1

" default follows 'timeoutlen' (=1000ms).
"let g:operator#sandwich#timeoutlen =
"let g:sandwich#recipes = [
"      \   {'buns': ['(', ')']}
"      \   {'buns': ['((', '))']}
"      \   {'buns': ['{' '}']}
"      \ ]

"   unlike <Plug>(textobj-sandwich-literal-query-i),
" accords to 'g:sandwich#recipes' and 'g:textobj#sandwich#recipes'.
"   if g:textobj#sandwich#recipes is set, g:textobj#sandwich#default_recipes
" will be ignored.

" a text surrounded by a pair of braket or of the same characters as user input
" i.e., the text-obj followed by '(' is regarded to be surrounded by '(' and ')'
omap <space>i <Plug>(textobj-sandwich-query-i)
xmap <space>i <Plug>(textobj-sandwich-query-i)
omap <space>a <Plug>(textobj-sandwich-query-a)
xmap <space>a <Plug>(textobj-sandwich-query-a)

"" a text surrounded by a pair of literally the same characters as user input
"" i.e., the text-obj followed by '(' is regarded to be surrounded by '(' and '('
"omap <space>i <Plug>(textobj-sandwich-literal-query-i)
"xmap <space>i <Plug>(textobj-sandwich-literal-query-i)
"omap <space>a <Plug>(textobj-sandwich-literal-query-a)
"xmap <space>a <Plug>(textobj-sandwich-literal-query-a)
