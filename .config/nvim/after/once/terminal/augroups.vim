augroup myOnce/Terminal/DeleteBufferOnExit
  if has('nvim')
    " Note: Instead, `:bwipeout!` here crashes nvim instance.
    au TermClose * exe 'bdelete!' expand('<abuf>')
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
