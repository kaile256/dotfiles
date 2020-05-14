" From: init.vim

if expand('%:p') =~# '\(/\.git\)\|\(^/\(home\|tmp\)\)/'
      \ || &diff
  finish
endif

setl nomodifiable
"setl signcolumn=

augroup myReadonlyLazy
  au!
  au OptionSet modifiable call s:map_toggle()
augroup END

function! s:map_toggle() abort
  if !&modifiable
    nnoremap <buffer> d <c-d>
    nnoremap <buffer> u <c-u>
    return
  endif

  silent! nunmap <buffer> u
  silent! nunmap <buffer> d
endfunction
