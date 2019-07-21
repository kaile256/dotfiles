" default: for current buffer
" add !:   for all buffers

"" No Marks
nnoremap <a-"> :<c-u>NoShowMarks!<cr>
"" Preview Marks
nnoremap <space>` :<c-u>PreviewMarks<cr>
nnoremap <a-'> :<c-u>DoShowMarks!<cr>
nmap m m:ShowMarksOnce<cr>

augroup ShowMarkAuto
  au WinEnter,BufWinEnter * ShowMarksOnce<cr>
augroup END

