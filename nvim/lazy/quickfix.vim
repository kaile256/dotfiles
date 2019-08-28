" From: init.vim
if exists('g:loaded_lazy_quickfix')
  finish
endif
let g:loaded_lazy_quickfix = 1

setl signcolumn=

function! s:quickfix_keymap()

  nnoremap <buffer> <c-o> :cprevious<cr>
  nnoremap <buffer> <c-i> :cnext<cr>
  nnoremap <buffer> <a-]> :cnewer<cr>
  nnoremap <buffer> <a-[> :colder<cr>

endfunction

call <SID>quickfix_keymap()
