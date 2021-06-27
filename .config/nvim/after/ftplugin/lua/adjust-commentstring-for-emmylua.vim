let b:caw_hatpos_sp = ''

function! s:adjust_commentstring() abort
  let s:last_row = line('.')
  const pat_non_emmylua =
        \ '\%(^end$\)\|\%(^return \)\|\%(\%(local .* = \)\?function.*(\)'
  const should_use_emmylua = indent(nextnonblank('.')) == 0
        \ && getline('.') !~# pat_non_emmylua
  let &commentstring = (should_use_emmylua ? '---' : '-- ') .. '%s'
  let b:caw_oneline_comment = matchstr(&commentstring, '.*\ze%s')
endfunction

call s:adjust_commentstring()
augroup myFtLua/adjustCommentstringForEmmyLua
  autocmd!
  autocmd TextChanged,TextChangedI <buffer> call s:adjust_commentstring()
  autocmd CursorMoved <buffer> if line('.') != s:last_row |
        \ call s:adjust_commentstring() | endif
augroup END
