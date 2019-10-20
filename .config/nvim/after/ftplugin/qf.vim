" From: init.vim

augroup QuickfixKeymap
  au!
setl signcolumn=
  function! s:my_qt_keymap() "{{{
    nnoremap <buffer> <c-o> :cprevious<cr>
    nnoremap <buffer> <c-i> :cnext<cr>
    nnoremap <buffer> <a-]> :cnewer<cr>
    nnoremap <buffer> <a-[> :colder<cr>
  endfunction "}}}
  au BufWinEnter * if &ft == 'qf' | call <SID>my_qt_keymap() | endif
augroup END
