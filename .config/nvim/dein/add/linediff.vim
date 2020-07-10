" From: default.toml
" Repo: AndrewRadev/linediff.vim

" Keymap; Get Compared
nnoremap gc :Linediff<cr>
xnoremap gc :Linediff<cr>

nnoremap gC :LinediffReset<cr>

" default: tabnew
"let g:linediff_first_buffer_command = 'new'
" default: rightbelow vertical new
" let g:linediff_further_buffer_command = 'vert above new'

" Available: 'tempfile' or 'scratch'
" tempfile: external commands (like `make`) will apply to the original buffers.
" scratch: external commands (like `make`) will apply to the scratch buffers.
let g:linediff_buffer_type = 'scratch'
