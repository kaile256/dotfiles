" From: tool.toml
"  Ref: easymotion.vimrc

" Let; do_mapping
" 0: no-default
" 1: default
let g:EasyOperator_phrase_do_mapping = 0

" Keymap; 'Unmoved' Delete/Yank
nmap cu         <plug>(easyoperator-phrase-select)
nmap du         <Plug>(easyoperator-phrase-delete)
nmap yu         <plug>(easyoperator-phrase-yank)
vmap <a-c><a-u> <esc><plug>(easyoperator-phrase-select)
vmap <a-d><a-u> <esc><Plug>(easyoperator-phrase-delete)
vmap <a-y><a-u> <esc><plug>(easyoperator-phrase-yank)
vmap <a-c>u     <esc><plug>(easyoperator-phrase-select)
vmap <a-d>u     <esc><Plug>(easyoperator-phrase-delete)
vmap <a-y>u     <esc><plug>(easyoperator-phrase-yank)
tmap <a-c><a-u> <c-\><c-n><plug>(easyoperator-phrase-select)
tmap <a-d><a-u> <c-\><c-n><Plug>(easyoperator-phrase-delete)
tmap <a-y><a-u> <c-\><c-n><plug>(easyoperator-phrase-yank)
tmap <a-c>u     <c-\><c-n><plug>(easyoperator-phrase-select)
tmap <a-d>u     <c-\><c-n><Plug>(easyoperator-phrase-delete)
tmap <a-y>u     <c-\><c-n><plug>(easyoperator-phrase-yank)
