" From: init.vim

setl signcolumn=

if !exists('*s:my_qt_keymap') "{{{1
  function! s:my_qt_keymap()
    nnoremap <buffer> <c-o> :cprevious<cr>
    nnoremap <buffer> <c-i> :cnext<cr>
    nnoremap <buffer> <a-]> :cnewer<cr>
    nnoremap <buffer> <a-[> :colder<cr>
  endfunction
endif

call s:my_qt_keymap()
