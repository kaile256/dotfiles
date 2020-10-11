
finish

setl fdm=expr fde=PhpFoldExpr()

if exists('b:undo_ftplugin')
  let b:undo_ftplugin .= ' | '
else
  let b:undo_ftplugin = ''
endif
let b:undo_ftplugin .= 'setl fdm< fde<'

function! PhpFoldExpr() abort
  let line = getline(v:lnum)
  let prev = getline(v:lnum - 1)
  let next = getline(v:lnum + 1)

  if prev =~# '<?php'
    return '>1'
  elseif next =~# '?>'
    return '<1'
  elseif line =~# '\s*class \w\+'
    return '>2'
  elseif line =~# '\s*function \w\+('
    return '>3'

  elseif line =~# '{$'
    return 'a1'
  elseif line =~# '}$'
    return 's1'
  endif

  return '='
endfunction
