" From: motion.toml
" Repo: bkad/CamelCaseMotion
" PR-Merged: bkad/CamelCaseMotion/pull/41

" Convenience
"noremap ie iw

" Overwite; webge
map w  <Plug>CamelCaseMotion_w
map b  <Plug>CamelCaseMotion_b
map e  <Plug>CamelCaseMotion_e
map ge <Plug>CamelCaseMotion_ge
sunmap w
sunmap b
sunmap e
sunmap ge
" TODO: no delay on 'e' in operator
"omap <expr> <Plug>CamelCaseMotion_e_modified (getline('.')[col('.')] ==# ' ') ? 'l' : '<Plug>CamelCaseMotion_e'
"omap e <Plug>CamelCaseMotion_e_modified

" Mnemonic: Quickback
map q <Plug>CamelCaseMotion_ge
noremap Q gE
sunmap q
sunmap Q

" Overwrite; Text Object
" TODO: keep cursor
omap iw <Plug>CamelCaseMotion_ie
xmap iw <Plug>CamelCaseMotion_ie
"omap ib <Plug>CamelCaseMotion_ib
"xmap ib <Plug>CamelCaseMotion_ib
