" default: for current buffer
" add !:   for all buffers

"" Current Marks
noremap <a-c><a-m> :<c-u>DoShowMarks<cr>
"" All Marks
noremap <a-a><a-m> :<c-u>DoShowMarks!<cr>

"" No Marks
noremap <a-n><a-m> :<c-u>NoShowMarks!<cr>
"" Preview Marks
noremap <a-p><a-m> :<c-u>PreviewMarks<cr>

"" Show Marks with default-vim actions
noremap ` :<c-u>ShowMarksOnce<cr>`
noremap m :<c-u>ShowMarksOnce<cr>m
