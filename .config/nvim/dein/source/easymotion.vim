" From: motion.toml
" Repo: easymotion/vim-easymotion
" Fork: kaile256/vim-easymotion
" Another: add/easymotion.vim
" Another: post/easymotion.vim
" Ref: add/sneak.vim

" Original
let g:EasyMotion_always_jump_first = 1

" `g:EasyMotion_do_mapping = 1` provides all the default keymaps.
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_enter_jump_first = 1
let g:EasyMotion_space_jump_first = 1
" Set apart vim's default n-key history.
let g:EasyMotion_add_search_history = 0

" Chars
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_upper = 1
let g:EasyMotion_keys = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
" `g:EasyMotion_use_migemo` is independentt to 'cmigemo'.
" because Easymotion includes basic regex patterns.
let g:EasyMotion_use_migemo = 0

" Prompt
" verbose like 'EasyMotion: Jumping to [l,c]' and 'EasyMotion: Cancelled'.
let g:EasyMotion_verbose = 0
let g:EasyMotion_prompt = 'EasyMotion: {n} Chars >>> '
let g:EasyMotion_show_prompt = 0
"let g:EasyMotion_use_regexp = 1

" Highlight
"let g:EasyMotion_inc_highlight
"let g:EasyMotion_move_highlight
"let g:EasyMotion_landing_highlight
"let g:EasyMotion_cursor_highlight
