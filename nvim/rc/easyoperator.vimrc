" From: tool.toml
" Repo: haya14busa/vim-easyoperator-phrase
" Alter: easymotion.vimrc

" Let; do_mapping
" 0: no-default
" 1: default
let g:EasyOperator_phrase_do_mapping = 0

" Keymap; 'Unmoved' Delete/Yank
" TODO: work w/ clipboard

omap <expr> U
      \ (v:operator == 'y')? <plug>(easyoperator-phrase-yank)
      \ (v:operator == 'd')? <Plug>(easyoperator-phrase-delete)
      \ (v:operator == 'c')? <plug>(easyoperator-phrase-select)
