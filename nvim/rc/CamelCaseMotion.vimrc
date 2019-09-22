" From: tool.toml

"" Convenience
"onoremap ie iw
"xnoremap ie iw

" Overwite; webge
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
map <silent> ge <Plug>CamelCaseMotion_ge

" Overwite; Text Object
" Note: has do not extend range on visual mode,
" but replace, or even shrink, previously selected range.
"omap <silent> iw <Plug>CamelCaseMotion_ie
"omap <silent> ib <Plug>CamelCaseMotion_ib
omap <silent> ic <Plug>CamelCaseMotion_ie
"xmap <silent> iw <Plug>CamelCaseMotion_ie
"xmap <silent> ib <Plug>CamelCaseMotion_ib
xmap <silent> ic <Plug>CamelCaseMotion_ie

" Evacuation; for default webge
" Mnemonic: 'Quicker' than those of CamelCaseMotion
noremap qw w
noremap qe e
noremap qb b
" Mnemonic: Quick Reverse; also 'r' is the next to [q,e] on qwerty keyboard.
noremap qr ge
