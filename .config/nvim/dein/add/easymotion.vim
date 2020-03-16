" From: motion.toml
" Repo: easymotion/vim-easymotion
" Fork: kaile256/vim-easymotion
" Else: add/easymotion.vim
" Else: source/easymotion.vim
" Ref: add/sneak.vim

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
"sunmap <space>f
"sunmap <space>t
"sunmap <space>F
"sunmap <space>T

" Keymap; hjkl
map ; <Plug>(easymotion-next)
map , <Plug>(easymotion-prev)

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

