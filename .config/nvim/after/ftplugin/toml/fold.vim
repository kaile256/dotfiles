setlocal fdm=expr fde=TomlFoldExpr(v:lnum)

if exists('b:undo_ftplugin')
  let b:undo_ftplugin .= ' | '
else
  let b:undo_ftplugin = ''
endif
let b:undo_ftplugin .= 'setl fdm< fde<'

function! TomlFoldExpr(lnum) abort
  let line = getline(a:lnum)

  if line =~# '^[# ]*\[.*]'
    return '>1'
  endif

  return '='
endfunction

