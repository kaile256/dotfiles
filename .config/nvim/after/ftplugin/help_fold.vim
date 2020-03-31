setl fdm=expr fde=HelpFoldExpr() fdl=1
if exists('b:undo_ftplugin')
  let b:undo_ftplugin .= ' | '
else
  let b:undo_ftplugin = ''
endif
let b:undo_ftplugin .= 'setl fdm< fde<'

function! HelpFoldExpr() abort "{{{1
  let line = getline(v:lnum)

  if line =~# '^[=-]\+$'
    return '>1'
  elseif line =~# '\*.*\*\s*$' && line !~# '^\s*\u\+'
    return '>2'
  endif

  return '='
endfunction
