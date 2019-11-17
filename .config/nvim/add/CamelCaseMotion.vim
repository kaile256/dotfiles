" From: motion.toml
" Repo: bkad/CamelCaseMotion

" Convenience
"onoremap ie iw
"xnoremap ie iw

" Overwite; webge
map <silent> w <Plug>CamelCaseMotion_wzv
map <silent> b <Plug>CamelCaseMotion_bzv
map <silent> e <Plug>CamelCaseMotion_ezv
map <silent> ge <Plug>CamelCaseMotion_gezv
sunmap w
sunmap b
sunmap e
sunmap ge

imap <silent> <a-w> <esc><Plug>CamelCaseMotion_wzv
imap <silent> <a-b> <esc><Plug>CamelCaseMotion_bzv
imap <silent> <a-e> <esc><Plug>CamelCaseMotion_ezv

" Overwrite; Text Object
omap <silent> iw <Plug>CamelCaseMotion_iezv
xmap <silent> iw <Plug>CamelCaseMotion_iezv
"omap <silent> ib <Plug>CamelCaseMotion_ibzv
"xmap <silent> ib <Plug>CamelCaseMotion_ibzv
