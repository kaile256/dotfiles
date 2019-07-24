"""" From: 'leap.toml'
" default: for current buffer
" add !:   for all buffers

"" No Marks
nmap <silent> <space><space> :<c-u>NoShowMarks!<cr>[g:refresh]
"" Preview Marks
nnoremap '<space> :<c-u>PreviewMarks<cr>
nnoremap `<space> :<c-u>DoShowMarks!<cr>
nnoremap m<space> :ShowMarksOnce<cr>

augroup ShowMarkAuto
  au BufWinEnter * ShowMarksOnce<cr>
augroup END

