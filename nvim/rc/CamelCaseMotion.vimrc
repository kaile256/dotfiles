" From: tool.toml

"" Convenience
"onoremap ie iw
"xnoremap ie iw

" Overwite; webge
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
map <silent> ge <Plug>CamelCaseMotion_ge
sunmap w
sunmap b
sunmap e
sunmap ge

imap <silent> <a-w> <esc><Plug>CamelCaseMotion_w
imap <silent> <a-b> <esc><Plug>CamelCaseMotion_b
imap <silent> <a-e> <esc><Plug>CamelCaseMotion_e

" Overwrite; Text Object
omap <silent> iw <Plug>CamelCaseMotion_ie
xmap <silent> iw <Plug>CamelCaseMotion_ie
"omap <silent> ib <Plug>CamelCaseMotion_ib
"xmap <silent> ib <Plug>CamelCaseMotion_ib

" Evacuation; for default webge
" Mnemonic: 'Quicker' than those of CamelCaseMotion
noremap qw w
noremap qe e
noremap qb b
" Mnemonic: Quick Reverse; also 'r' is the next to [q,e] on qwerty keyboard.
noremap qr ge

"" Evacuation; for default text-object
"onoremap iqw iw
"onoremap iqb ib
"xnoremap iqw iw
"xnoremap iqb ib
