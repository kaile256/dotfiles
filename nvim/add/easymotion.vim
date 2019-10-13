" From: motion.toml
" Repo: easymotion/vim-easymotion
" Alter: post/easymotion.vim

" Let; mapping {{{
" `g:EasyMotion_do_mapping = 1` provides all the default keymaps.
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_enter_jump_first = 1
let g:EasyMotion_space_jump_first = 1
" linefeed (newline) feature is original config,
" which is written directory on the repository.
let g:EasyMotion_linefeed_jump_first = 1
let g:EasyMotion_expandable_linefeed_jump_first = 1
" Set apart vim's default n-key history.
let g:EasyMotion_add_search_history = 0
"}}}

" Let; Chars "{{{
let g:EasyMotion_smartcase = 0
let g:EasyMotion_use_upper = 1
let g:EasyMotion_keys = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
"}}}

" Let; Prompt "{{{
" verbose: such as "EasyMotion: Jumping to [l,c]" and "EasyMotion: Cancelled".
let g:EasyMotion_verbose = 0
let g:EasyMotion_prompt = 'EasyMotion: {n} Chars >>> '
"let g:EasyMotion_show_prompt = 0
"let g:EasyMotion_use_regexp = 1
"}}}

" Let; Migemo {{{1
" TODO: Associate with eskk.vim?
" `g:EasyMotion_use_migemo` is independentt to 'cmigemo'.
" because Easymotion includes basic regex patterns.
let g:EasyMotion_use_migemo = 0
"}}}

" Highlight {{{1
"let g:EasyMotion_inc_highlight
"let g:EasyMotion_move_highlight
"let g:EasyMotion_landing_highlight
"let g:EasyMotion_cursor_highlight
hi link EasyMotionTarget ErrorMsg
hi link EasyMotionTarget2First ErrorMsg
hi link EasyMotionTarget2Second ErrorMsg
hi link EasyMotionShade Nontext
hi link EasyMotionMoveHL ErrorMsg
hi link EasyMotionIncSearch Search
"}}}

" Excerpt of Help; about keymap
" 0: keep cursor colum JK motion
" <Plug>(easymotion-web/WEB): replace word/WORD with Keys.
" <Plug>(easymotion-s): the range is inside current screen.
" <Plug>(easymotion-sl): the range is limited to current line.

" Keymap; ft;,
"map f <Plug>(easymotion-f)
"map t <Plug>(easymotion-t)
"map F <Plug>(easymotion-F)
"map T <Plug>(easymotion-T)

map f <Plug>(easymotion-f2)
map t <Plug>(easymotion-t2)
map F <Plug>(easymotion-F2)
map T <Plug>(easymotion-T2)
"sunmap <space>f
"sunmap <space>t
"sunmap <space>F
"sunmap <space>T

" Keymap; hjkl
map ; <Plug>(easymotion-next)
map , <Plug>(easymotion-prev)

