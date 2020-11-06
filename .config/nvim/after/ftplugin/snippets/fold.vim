" prevents coc-snippets overwrite fdm.
let b:did_ftplugin = 1

setlocal expandtab
setlocal fdm=expr fde=SnippetsFoldExpr(v:lnum)
if exists('b:undo_ftplugin')
  let b:undo_ftplugin .= ' | '
else
  let b:undo_ftplugin = ''
endif
let b:undo_ftplugin .= 'setl fdm< fde<'

function! SnippetsFoldExpr(lnum) abort
  let syntax = synIDattr(synID(a:lnum, 1, 0), 'name')
  if syntax =~# '^snip.*HeaderKeyword$'
    " for Header/Context/Priority etc.
    return '>1'
  endif
  return '='
endfunction
