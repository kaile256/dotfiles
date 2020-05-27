setl fdm=expr fde=ShFoldExpr(v:lnum)
if exists('b:undo_ftplugin')
  let b:undo_ftplugin .= ' | '
else
  let b:undo_ftplugin = ''
endif
let b:undo_ftplugin .= 'setl fdm< fde<'

function! ShFoldExpr(lnum) abort
  let line = getline(v:lnum)
  if line =~# '($'
    return '>1'
  elseif line =~# 'do$'
    return 'a1'
  elseif line =~# 'done$'
    return 's1'
  endif

  return '='
endfunction
