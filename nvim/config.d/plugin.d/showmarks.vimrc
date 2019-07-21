" default: for current buffer
" add !:   for all buffers

"" No Marks
noremap <space>nm :<c-u>NoShowMarks!<cr>
"" Preview Marks
noremap <space>` :DoShowMarks!<cr><c-u>PreviewMarks<cr>
noremap <space>' :DoShowMarks!<cr><c-u>PreviewMarks<cr>
noremap <space>m :DoShowMarks!<cr><c-u>PreviewMarks<cr>

"" Show Marks with default-vim actions
noremap <silent> ` :<c-u>ShowMarksOnce<cr>`
noremap <silent> ' :<c-u>ShowMarksOnce<cr>'
noremap <silent> m :<c-u>ShowMarksOnce<cr>m

augroup MarkWithCursor
  au WinEnter,BufWinEnter * silent! <c-u>ShowMarksOnce<cr>
augroup END

