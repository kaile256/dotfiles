" From: motion.toml
" Repo: bkad/CamelCaseMotion

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
