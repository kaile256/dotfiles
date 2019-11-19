" From: motion.toml
" Repo: bkad/CamelCaseMotion
" Fork: kaile256/CamelCaseMotion

" Convenience
"onoremap ie iw
"xnoremap ie iw

" Overwite; webge
nmap <silent> w  <Plug>CamelCaseMotion_w
nmap <silent> b  <Plug>CamelCaseMotion_b
nmap <silent> e  <Plug>CamelCaseMotion_e
nmap <silent> ge <Plug>CamelCaseMotion_ge
omap <silent> w  <Plug>CamelCaseMotion_w
omap <silent> b  <Plug>CamelCaseMotion_b
omap <silent> e  <Plug>CamelCaseMotion_e
omap <silent> ge <Plug>CamelCaseMotion_ge

" Overwrite; Text Object
xmap <silent> iw <Plug>CamelCaseMotion_ie
omap <silent> iw <Plug>CamelCaseMotion_ie
"omap <silent> ib <Plug>CamelCaseMotion_ib
"xmap <silent> ib <Plug>CamelCaseMotion_ib
