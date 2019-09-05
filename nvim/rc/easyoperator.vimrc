" From: tool.toml
"  Ref: easymotion.vimrc

" Let; do_mapping
" 0: no-default
" 1: default
let g:EasyOperator_phrase_do_mapping = 0

" Keymap; 'Unmoved' Delete/Yank
nmap cu <plug>(easyoperator-phrase-select)
nmap du <Plug>(easyoperator-phrase-delete)
nmap yu <plug>(easyoperator-phrase-yank)
