"""" From: 'leap.toml'

"" No Marks
" default: for current buffer
"   add !:   for all buffers
nmap <silent> [g:redraw] :<c-u>NoShowMarks!<cr>[g:redraw]
nmap <silent> [g:complete_redraw] :<c-u>NoShowMarks!<cr>[g:complete_redraw]

"" Preview Marks
nnoremap <space>' :<c-u>PreviewMarks<cr>
nnoremap <space>` :<c-u>DoShowMarks!<cr>
nnoremap m<space> :ShowMarksOnce<cr>

"augroup ShowMarkAuto
"  au BufWinEnter * DoShowMarks<cr>
"augroup END

