" From: tool.toml

" Keymap; Get Compared
nnoremap gC :Linediff<cr>
xnoremap gC :Linediff<cr>

" default: tabnew
let g:linediff_first_buffer_command = 'new'
" default: rightbelow vertical new
let g:linediff_second_buffer_command = 'vertical aboveleft new'
