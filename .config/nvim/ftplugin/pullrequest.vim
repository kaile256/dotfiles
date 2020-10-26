augroup Pullrequset-ToggleModifiable
  au!
  au CursorMoved,CursorMovedI PULLREQ_EDITMSG call s:toggle_modifiable()
augroup END

function! s:toggle_modifiable() abort
  let uneditable_border = '^# -\{20,}'
  exe 'setlocal'
        \ (getline('.') =~# uneditable_border ? 'no' : '')
        \ .'modifiable'
endfunction
