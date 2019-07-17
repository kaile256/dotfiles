" default: for current buffer
" add !:   for all buffers

"" Current Marks
noremap <space>cm :<c-u>DoShowMarks<cr>
"" All Marks
noremap <space>am :<c-u>DoShowMarks!<cr>

"" No Marks
noremap <space>nm :<c-u>NoShowMarks!<cr>
"" Preview Marks
noremap <space>pm :<c-u>PreviewMarks<cr>

"" Show Marks with default-vim actions
noremap <silent> ` :<c-u>ShowMarksOnce<cr>`
noremap <silent> m :<c-u>ShowMarksOnce<cr>m

" "augroup show_marks_sync
" "  autocmd!
" "  autocmd BufReadPost * silent! DoShowMarks
" "augroup END
" 
