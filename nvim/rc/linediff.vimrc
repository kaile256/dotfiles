" From: tool.toml

" Keymap; Get Compared
vnoremap <silent> <Plug>(linediff-standard) :Linediff<cr>
vmap gc <Plug>(linediff-standard)

" default: tabnew
let g:linediff_first_buffer_command = 'new'
" default: rightbelow vertical new
let g:linediff_second_buffer_command = 'vertical aboveleft new'

augroup LinediffKeymap
  au User LinediffBufferReady nnoremap <buffer> q :LinediffReset<cr>
augroup END
