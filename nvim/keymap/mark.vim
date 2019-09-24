"" From: init.vim
""  Ref: showmarks.vimrc

function! s:deal_marks_lower() "{{{
  if !exists('b:mark_inc_lower')
    let b:marksdealer#marklist_lower = 'abcdefghijklmnopqrstuvwxyz'
  endif
  if !exists('b:last_mark_lower')
    let b:marksdealer#lastmark_lower = 0
  else
    let b:marksdealer#lastmark_lower = (b:marksdealer#lastmark_lower + 1) % len(b:marksdealer#marklist_lower)
  endif
  silent execute 'mark' b:marksdealer#marklist_lower[b:marksdealer#lastmark_lower]
  echo  'marked' b:marksdealer#marklist_lower[b:marksdealer#lastmark_lower]
endfunction "}}}
function! s:deal_marks_upper() "{{{
  if !exists('b:mark_inc_upper')
    let g:marksdealer#marklist_upper = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
  endif
  if !exists('b:last_mark_upper')
    let g:last_mark_upper = 0
  else
    let g:last_mark_upper = (g:last_mark_upper + 1) % len(g:marksdealer#marklist_upper)
  endif
  silent execute 'mark' g:marksdealer#marklist_upper[g:last_mark_upper]
  echo  'marked' g:marksdealer#marklist_upper[g:last_mark_upper]
endfunction "}}}

" Mark; Keymap
command! DealMarksLower :call <SID>deal_marks_lower()<cr>
command! DealMarksUpper :call <SID>deal_marks_upper()<cr>
nnoremap <silent> mm :DealMarksLower<cr>
nnoremap <silent> mM :DealMarksUpper<cr>

" Mark; Augroup
"augroup RememberLastCursor
"  " cause ERROR on defx.
"  au!
"  au BufLeave * exe "normal mp"
"  au BufLeave * exe "normal mP"
"augroup END
"augroup MarkOnBufLeave
"  au! BufLeave * call <SID>AutoIncMarkUpper()
"augroup END
