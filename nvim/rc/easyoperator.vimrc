""" From: tool.toml
"""  Ref: easymotion.vimrc

" Let; do_mapping
" 0: no-default
" 1: default
let g:EasyOperator_phrase_do_mapping = 0

" Keymap; 'Unmoved' Delete/Yank
nmap <nowait> du <Plug>(easyoperator-phrase-delete)
nmap <nowait> yu <Plug>(easyoperator-phrase-yank)
