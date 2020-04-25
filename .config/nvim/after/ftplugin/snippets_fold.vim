setl fdm=expr fde=SnippetsFoldExpr() fdl=1
if exists('b:undo_ftplugin')
  let b:undo_ftplugin .= ' | '
else
  let b:undo_ftplugin = ''
endif
let b:undo_ftplugin .= 'setl fdm< fde<'

function! SnippetsFoldExpr() abort
  let syntax = synIDattr(synID(v:lnum, 1, 0), 'name')
  if syntax =~# 'snip.*Keyword' && syntax !~# 'Footer'
    " for Header/Context/Priority etc.
    return '>1'
  endif
  return '='
endfunction
