" From: tool.toml
" Repo: haya14busa/vim-easyoperator-phrase
" Alter: easymotion.vimrc

" Let; do_mapping
" 0: no-default
" 1: default
let g:EasyOperator_phrase_do_mapping = 0

" Keymap; 'Unmoved' Delete/Yank
" TODO: work w/ clipboard
"nmap <space>cu         "+<plug>(easyoperator-phrase-select)
"nmap <space>du         "+<Plug>(easyoperator-phrase-delete)
"nmap <space>yu         "+<plug>(easyoperator-phrase-yank)
nmap cU         <plug>(easyoperator-phrase-select)
nmap dU         <Plug>(easyoperator-phrase-delete)
nmap yU         <plug>(easyoperator-phrase-yank)
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
