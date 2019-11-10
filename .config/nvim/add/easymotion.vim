" From: motion.toml
" Repo: easymotion/vim-easymotion
" Fork: kaile256/vim-easymotion
" Alter: post/easymotion.vim
" Ref: add/sneak.vim

" Let; mapping {{{
" `g:EasyMotion_do_mapping = 1` provides all the default keymaps.
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_enter_jump_first = 1
let g:EasyMotion_space_jump_first = 1
" Set apart vim's default n-key history.
let g:EasyMotion_add_search_history = 0

" Original
let g:EasyMotion_always_jump_first = 1

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

" Let; Migemo {{{
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

map f <Plug>(easymotion-f)
map t <Plug>(easymotion-t)
map F <Plug>(easymotion-F)
map T <Plug>(easymotion-T)
imap <a-f> <esc><Plug>(easymotion-f)
imap <a-t> <esc><Plug>(easymotion-t)
imap <a-F> <esc><Plug>(easymotion-F)
imap <a-T> <esc><Plug>(easymotion-T)
"sunmap <space>f
"sunmap <space>t
"sunmap <space>F
"sunmap <space>T

" Keymap; hjkl
map ; <Plug>(easymotion-next)
map , <Plug>(easymotion-prev)
imap <a-;> <Plug>(easymotion-next)
imap <a-,> <Plug>(easymotion-prev)

" TODO: make below work.
"nnoremap g<space>   :call <SID>find_skip_char('forward')<cr>
"nnoremap g<s-space> :call <SID>find_skip_char('backward')<cr>
"function s:find_skip_char(direction)
"  let l:ww = &l:whichwrap
"  setl whichwrap=h,l
"
"  while line('$')
"    if a:direction ==? 'backward'
"      let l:direction = 'h'
"    else
"      let l:direction = 'l'
"    endif
"    exe 'norm!' l:direction
"
"    let l:chars = [' ', '#', '_', '-']
"    for l:c in l:chars
"      if getline('.')[col('.') - 1] ==# l:c | break | endif
"    endfor
"  endwhile
"
"  exe 'setl whichwrap='. l:ww
"endfunction

