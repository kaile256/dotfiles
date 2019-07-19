" default: for current buffer
" add !:   for all buffers

"" No Marks
noremap <space>nm :<c-u>NoShowMarks!<cr>
"" Preview Marks
noremap <space>` :<c-u>PreviewMarks<cr>DoShowMarks!<cr>
noremap <space>' :<c-u>PreviewMarks<cr>DoShowMarks!<cr>
noremap <space>m :<c-u>PreviewMarks<cr>DoShowMarks!<cr>

"" Show Marks with default-vim actions
noremap <silent> ` :<c-u>ShowMarksOnce<cr>`
noremap <silent> ' :<c-u>ShowMarksOnce<cr>'
noremap <silent> m :<c-u>ShowMarksOnce<cr>m

" "augroup show_marks_sync
" "  autocmd!
" "  autocmd BufReadPost * silent! DoShowMarks
" "augroup END
" 
