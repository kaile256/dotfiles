" From: init.vim

function! marksdealer#lower()
  if !exists('g:marksdealer#marklist_lower')
    let g:marksdealer#marklist_lower = 'abcdefghijklmnopqrstuvwxyz'
  endif
  if !exists('b:marksdealer_lastmark_lower')
    let b:marksdealer_lastmark_lower = 0
  else
    let b:marksdealer_lastmark_lower = (b:marksdealer_lastmark_lower + 1) % len(g:marksdealer#marklist_lower)
  endif
  silent execute 'mark '. g:marksdealer#marklist_lower[b:marksdealer_lastmark_lower]
  echo  ' marked '. g:marksdealer#marklist_lower[b:marksdealer_lastmark_lower]
endfunction
function! marksdealer#upper()
  if !exists('g:marksdealer#marklist_upper')
    let g:marksdealer#marklist_upper = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
  endif
  if !exists('g:marksdealer_lastmark_upper')
    let g:marksdealer_lastmark_upper = 0
  else
    let g:marksdealer_lastmark_upper = (g:marksdealer_lastmark_upper + 1) % len(g:marksdealer#marklist_upper)
  endif
  silent execute 'mark '. g:marksdealer#marklist_upper[g:marksdealer_lastmark_upper]
  echo  ' marked '. g:marksdealer#marklist_upper[g:marksdealer_lastmark_upper]
endfunction

" Keymap
command! DealMarksLower :call marksdealer#lower()
command! DealMarksUpper :call marksdealer#upper()
nnoremap <silent> mm :DealMarksLower<cr>
nnoremap <silent> mM :DealMarksUpper<cr>

"augroup RememberLastCursor
"  " cause ERROR on defx.
"  au!
"  au BufLeave * exe "normal mp"
"  au BufLeave * exe "normal mP"
"augroup END
"augroup MarkOnBufLeave
"  au! BufLeave * call <SID>AutoIncMarkUpper()
"augroup END
