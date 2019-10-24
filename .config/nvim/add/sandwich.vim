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
""}}}

" Keymap; Manual Select
" Mnemonic: Yield a pair of bans
nmap \y <Plug>(operator-sandwich-add)
" Mnemonic: Dispose the bans
nmap \d <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
" Mnemonic: Change the bans
nmap \c <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)

xmap \y <Plug>(operator-sandwich-add)
xmap \d <Plug>(operator-sandwich-delete)
xmap \c <Plug>(operator-sandwich-replace)

imap <a-\><a-y> <esc><Plug>(operator-sandwich-add)
imap <a-\><a-d> <esc><Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
imap <a-\><a-c> <esc><Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)

"" Keymap; Text Object {{{
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
"onoremap <silent><expr> is textobj#sandwich#query('o', 'i')
"xnoremap <silent><expr> is textobj#sandwich#query('x', 'i')
"onoremap <silent><expr> as textobj#sandwich#query('o', 'a')
"xnoremap <silent><expr> as textobj#sandwich#query('x', 'a')
"}}}
