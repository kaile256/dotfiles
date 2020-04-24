setl fdm=expr fde=SnippetsFoldExpr() fdl=1
if exists('b:undo_ftplugin')
  let b:undo_ftplugin .= ' | '
else
  let b:undo_ftplugin = ''
endif
let b:undo_ftplugin .= 'setl fdm< fde<'

function! SnippetsFoldExpr() abort
  let line = getline(v:lnum)
  if line =~? '^\%[#]\s*snippet\s*'
    " includes commented-out lines.
    return '>1'
  endif
  return '='
endfunction
