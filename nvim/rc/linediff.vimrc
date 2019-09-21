" From: tool.toml

" Keymap; Get Compared
vnoremap gc :Linediff<cr>

" default: tabnew
let g:linediff_first_buffer_command = 'new'
" default: rightbelow vertical new
let g:linediff_second_buffer_command = 'vertical aboveleft new'

augroup LinediffKeymap
  au User LinediffBufferReady nnoremap <buffer> q :LinediffReset<cr>
augroup END
