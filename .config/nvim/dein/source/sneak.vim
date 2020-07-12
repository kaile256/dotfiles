" From: motion.toml
" Repo: justinmk/vim-sneak
" Fork: kaile256/vim-sneak
" Ref: add/easymotion.vim
" Else: add/sneak.vim
" Else: post/sneak.vim

let g:sneak#no_default_mappings = 1
" let g:sneak#prompt = 'Sneak: v:count1 chars >>> '
let g:sneak#no_prompt = 1

" use 'ignorecase' & 'smartcase'
"let g:sneak#use_ic_scs = 1

"let g:sneak#s_next  = 1
" 0: Pressing f/t will repeat last motion as ;/,.
"let g:sneak#f_reset = 1
"let g:sneak#t_reset = 1

"let g:sneak#label = 1
" default for g:sneak#label_esc is "\<space>"
"let g:sneak#label_esc = '.'
let g:sneak#target_labels = 'abcedfghijklmnopqrstuvwxyz'

let g:sneak#trailing_another = 'e''"'
