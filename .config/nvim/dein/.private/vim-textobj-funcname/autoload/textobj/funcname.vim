function! s:is_ignored_hlgroups() abort
  let hlgroups = synIDattr(synID(line('.'), col('.'), 0), 'name')
  return hlgroups =~? 'string'
endfunction

function! textobj#funcname#select() abort
  let pat_funcname = '\h\w\+\ze\s*('
  let pat_lnum = '\%'. line('.') .'l'
  let is_cursor_on_funcname = search(, 'ncWb')
  let is_cursor_on_funcname = search('\%#'. pat_funcname, 'ncW')
  if is_cursor_on_funcname
    call search(pat_funcname, 'W')
  else
    let is_cursor_on_args = searchpair(pat_funcname, '', ')', 'bW', 's:is_ignored_hlgroups()')
  endif
  call setpos("'>", getpos('.'))
  call search('\S\+\%#', 'cbW')
  call setpos("'<", getpos('.'))
  norm! gv
endfunction
