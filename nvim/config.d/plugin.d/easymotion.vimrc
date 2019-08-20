""" From: tool.toml

" EasyMotion; Let {{{
" `g:EasyMotion_do_mapping` provides all the default keymaps.
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 0
let g:EasyMotion_enter_jump_first = 1
let g:EasyMotion_space_jump_first = 1

let g:EasyMotion_use_upper = 1
let g:EasyMotion_keys = 'OJKABCDEF'
let g:EasyMotion_use_migemo = 1

let g:EasyMotion_prompt = 'Request: {n} Chars >>> '
"let g:EasyMotion_startofline = 0
"let g:EasyMotion_grouping = 1
"}}}

" EasyMotion; Highlight {{{
hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade Search

hi link EasyMotionTarget2First MatchParen
hi link EasyMotionTarget2Second MatchParen

hi link EasyMotionMoveHL Search
hi link EasyMotionIncSearch Search
"}}}

" EasyMotion; Keymap {{{
" 0: keep cursor colum JK motion
"" <Plug>(easymotion-web/WEB): replace word/WORD with Keys
"" <Plug>(easymotion-s): the range is inside current screen
"" <Plug>(easymotion-sl): the range is limited to current line

noremap <silent> <c-j> 10j
noremap <silent> <c-k> 10k
noremap <c-h> gT
noremap <c-l> gt

 map <nowait>     Q      <Plug>(easymotion-overwin-f2)
imap <nowait> <a-Q> <esc><Plug>(easymotion-overwin-f2)

map f <Plug>(easymotion-f2)
map F <Plug>(easymotion-F2)
map t <Plug>(easymotion-t2)
map T <Plug>(easymotion-T2)

imap <a-f> <esc><Plug>(easymotion-f2)
imap <a-F> <esc><Plug>(easymotion-F2)
imap <a-t> <esc><Plug>(easymotion-t2)
imap <a-T> <esc><Plug>(easymotion-T2)

map ; <Plug>(easymotion-next)
map , <Plug>(easymotion-prev)

"" Keymap; Evacuation for default tf;, "{{{
" Mnemonic: 'Quicker', or shorter typing than those of EasyMotion
"           as EasyMotion expects another typing to select.
noremap qt t
noremap qT T
noremap qf f
noremap qF F
noremap q; ;
noremap q, ,
"}}}
"}}}
