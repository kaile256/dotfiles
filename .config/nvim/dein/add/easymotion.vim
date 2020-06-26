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

let s:cnt = {default -> v:count == 0 ? default : v:count}

function! s:f(cnt, mode) abort
  let cnt = s:cnt(a:cnt)
  call EasyMotion#S(cnt, a:mode, 0)
endfunction

function! s:F(cnt, mode) abort
  let cnt = s:cnt(a:cnt)
  call EasyMotion#S(cnt, a:mode, 1)
endfunction

function! s:t(cnt, mode) abort
  let cnt = s:cnt(a:cnt)
  call EasyMotion#T(cnt, a:mode, 0)
endfunction

function! s:T(cnt, mode) abort
  let cnt = s:cnt(a:cnt)
  call EasyMotion#T(cnt, a:mode, 1)
endfunction

nnoremap <silent> <space>f :<C-u>call <SID>f(1, 0)<CR>
onoremap <silent> <space>f :<C-u>call <SID>f(1, 0)<CR>
xnoremap <silent> <space>f :<C-u>call <SID>f(1, 1)<CR>

nnoremap <silent> <space>F :<C-u>call <SID>F(1, 0)<CR>
onoremap <silent> <space>F :<C-u>call <SID>F(1, 0)<CR>
xnoremap <silent> <space>F :<C-u>call <SID>F(1, 1)<CR>

nnoremap <silent> <space>t :<C-u>call <SID>t(1, 0)<CR>
onoremap <silent> <space>t :<C-u>call <SID>t(1, 0)<CR>
xnoremap <silent> <space>t :<C-u>call <SID>t(1, 1)<CR>

nnoremap <silent> <space>T :<C-u>call <SID>T(1, 0)<CR>
onoremap <silent> <space>T :<C-u>call <SID>T(1, 0)<CR>
xnoremap <silent> <space>T :<C-u>call <SID>T(1, 1)<CR>

" Keymap; ft;,
"map f <Plug>(easymotion-f)
"map t <Plug>(easymotion-t)
"map F <Plug>(easymotion-F)
"map T <Plug>(easymotion-T)
"sunmap <space>f
"sunmap <space>t
"sunmap <space>F
"sunmap <space>T

" " Keymap; hjkl
" map ; <Plug>(easymotion-next)
" map , <Plug>(easymotion-prev)

