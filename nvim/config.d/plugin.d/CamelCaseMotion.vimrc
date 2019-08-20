""" From: tool.toml

" CamelCaseMotion; Keymap {{{
" Keymap; Overwite Default Maps "{{{
"" Overwite; webge "{{{
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
map <silent> ge <Plug>CamelCaseMotion_ge
sunmap w
sunmap b
sunmap e
sunmap ge
"}}}

" Overwite; Text Object {{{
omap <silent> iw <Plug>CamelCaseMotion_iw
omap <silent> ib <Plug>CamelCaseMotion_ib
omap <silent> ie <Plug>CamelCaseMotion_ie
xmap <silent> iw <Plug>CamelCaseMotion_iw
xmap <silent> ib <Plug>CamelCaseMotion_ib
xmap <silent> ie <Plug>CamelCaseMotion_ie
"}}}
"}}}

" Keymap; Evacuation for default webge {{{
" Mnemonic: 'Quicker' than those of CamelCaseMotion
noremap qw w
noremap qe e
noremap qb b
" Mnemonic: Quick Reverse
noremap qr ge
"}}}
"}}}
