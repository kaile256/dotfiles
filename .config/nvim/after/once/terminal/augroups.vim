augroup myOnce/Terminal/DeleteBufferOnExit
  if has('nvim')
    function! s:delete_buf_on_exit(bufnr) abort
      " Note: Without `:stopinsert`, if it's been in Terminal mode on the
      " buffer to exit, and the coming buffer is also a terminal one, Terminal
      " mode would continue.
      stopinsert
      " Note: When &bufhidden is set, the following `:bdelete` would crash
      " another terminal buffer.
      if &bufhidden !=# '' | return | endif
      " Note: `:bwipeout!` instead would crash nvim instance; however, the
      " buffer would be no longer found in `:ls!` as if `:bwipeout`.
      exe 'bdelete!' a:bufnr
    endfunction
    au TermClose * call s:delete_buf_on_exit(expand('<abuf>'))
  endif
augroup END

augroup myOnce/Terminal/WorkaroundToKeepCursorHighlight
  au FocusLost term://* if mode() !=# 'n' |
        \ call feedkeys("\<C-\>\<C-n>i", 'n')
        \ | endif
augroup END

if !has('nvim')
  augroup myOnce/Terminal/LetTerminalOpenByTermPrefixedPath
    function! s:termopen_via_path() abort
      " Inspired by https://qiita.com/gorilla0513/items/0b0a30a6d5006515ae4d
      let cmd = matchstr(bufname(), 'term:\/\/\zs.*')
      exe 'term ++curwin ++close ++shell'
            \ (len(cmd) == 0 ? $SHELL : cmd)
    endfunction
    au BufReadCmd term://* call s:termopen_via_path()
  augroup END
endif
