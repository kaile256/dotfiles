"""" From: 'init.vim'
""""  Ref: showmarks.vimrc

"""" KEYMAP
"" Marks
nnoremap <silent> <space>m :<c-u>call <SID>AutoIncMarkUpper()<cr>
nnoremap <silent> <space>M :<c-u>call <SID>AutoIncMarkLower()<cr>
"nnoremap <a-m> m

"""" CONFIG
"augroup RememberLastCursor
"  " cause ERROR on defx.
"  au!
"  au BufLeave * exe "normal mp"
"  au BufLeave * exe "normal mP"
"augroup END
"augroup MarkOnBufLeave
"  au! BufLeave * call <SID>AutoIncMarkUpper()
"augroup END

"""" DEFINITION
if !exists('g:mark_inc_lower')
  let g:mark_inc_lower = 'abcdefghijklmnopqrstuvwxyz'
endif

if !exists('g:mark_inc_upper')
  let g:mark_inc_upper = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
endif

function! s:AutoIncMarkLower()
  if !exists('b:last_lower')
    let b:last_lower = 0
  else
    let b:last_lower = (b:last_lower + 1) % len(g:mark_inc_lower)
  endif
  silent execute 'mark' g:mark_inc_lower[b:last_lower]
  echo  'marked' g:mark_inc_lower[b:last_lower]
endfunction

function! s:AutoIncMarkUpper()
  if !exists('g:last_upper')
    let g:last_upper = 0
  else
    let g:last_upper = (g:last_upper + 1) % len(g:mark_inc_upper)
  endif
  silent execute 'mark' g:mark_inc_upper[g:last_upper]
  echo  'marked' g:mark_inc_upper[g:last_upper]
endfunction
