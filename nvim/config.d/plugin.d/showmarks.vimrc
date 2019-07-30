"""" From: 'leap.toml'

"" No Marks
" default: for current buffer
"   add !:   for all buffers
nmap <silent> [g:refresh] :<c-u>NoShowMarks!<cr>[g:refresh]
nmap <silent> [g:complete_refresh] :<c-u>NoShowMarks!<cr>[g:complete_refresh]

"" Preview Marks
nnoremap <space>' :<c-u>PreviewMarks<cr>
nnoremap <space>` :<c-u>DoShowMarks!<cr>
nnoremap m<space> :ShowMarksOnce<cr>

"augroup ShowMarkAuto
"  au BufWinEnter * DoShowMarks<cr>
"augroup END

