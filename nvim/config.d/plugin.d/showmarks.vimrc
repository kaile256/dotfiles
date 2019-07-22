"# Listed on 'lazy.toml'
" default: for current buffer
" add !:   for all buffers

"" No Marks
nmap <silent> <space><space> :<c-u>NoShowMarks!<cr>[g:refresh]
"" Preview Marks
nnoremap <space>` :<c-u>PreviewMarks<cr>
nnoremap <a-'> :<c-u>DoShowMarks!<cr>
nmap m m:ShowMarksOnce<cr>

augroup ShowMarkAuto
  au WinEnter,BufWinEnter * ShowMarksOnce<cr>
augroup END

