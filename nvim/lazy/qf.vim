" From: init.vim

augroup QuickfixKeymap
  au!
setl signcolumn=
  function! s:quickfix_keymap() "{{{
    nnoremap <buffer> <c-o> :cprevious<cr>
    nnoremap <buffer> <c-i> :cnext<cr>
    nnoremap <buffer> <a-]> :cnewer<cr>
    nnoremap <buffer> <a-[> :colder<cr>
  endfunction "}}}
  au BufWinEnter * if &ft == 'qf' | call <SID>quickfix_keymap() | endif
augroup END
