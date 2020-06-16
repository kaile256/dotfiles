" From: default.toml
" Repo: AndrewRadev/linediff.vim

" Keymap; Get Compared
nnoremap gc :Linediff<cr>
xnoremap gc :Linediff<cr>

nnoremap gC :LinediffReset<cr>

" default: tabnew
"let g:linediff_first_buffer_command = 'new'
" default: rightbelow vertical new
let g:linediff_second_buffer_command = 'vert above new'
