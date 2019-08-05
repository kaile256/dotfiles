"""" From: leap.toml
""""  Ref: appearance.vim
""""  Ref: mark.vim

"" No Marks
" default: for current buffer
"   add !:   for all buffers
nmap <silent> <c-space><c-space> :<c-u>NoShowMarks!<cr>
nmap <silent> <c-space>space :<c-u>NoShowMarks!<cr>

"" Preview Marks
nnoremap <silent> '<space> :<c-u>DoShowMarks!<cr>
nnoremap <silent> <space>' :<c-u>DoShowMarks!<cr>

nnoremap <silent> `<space> :<c-u>PreviewMarks<cr> 
nnoremap <silent> <space>` :<c-u>PreviewMarks<cr> 

"augroup ShowMarkAuto
"  au BufWinEnter * DoShowMarks<cr>
"augroup END

