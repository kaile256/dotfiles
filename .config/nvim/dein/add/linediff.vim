" From: default.toml
" Repo: AndrewRadev/linediff.vim

" Mnemonic: Get Compared
nmap <silent> gc <Plug>(linediff-operator)
nmap <silent> gC <Plug>(linediff-add-operator)

xnoremap <silent> gc :Linediff<CR>
xnoremap <silent> gC :LinediffAdd<CR>

nnoremap g<C-c> :<C-u>LinediffReset<cr>

" default: tabnew
"let g:linediff_first_buffer_command = 'new'
" default: rightbelow vertical new
" let g:linediff_further_buffer_command = 'vert above new'

" Available: 'tempfile' or 'scratch'
" tempfile: external commands (like `make`) will apply to the original buffers.
" scratch: external commands (like `make`) will apply to the scratch buffers.
let g:linediff_buffer_type = 'scratch'
