setl fdm=expr fde=MakeFoldExpr()
if exists('b:undo_ftplugin')
  let b:undo_ftplugin .= ' | '
else
  let b:undo_ftplugin = ''
endif
let b:undo_ftplugin .= 'setl fdm< fde<'

function! MakeFoldExpr() abort
  if getline(v:lnum)[0] =~# '[a-zA-Z#]'
        \ && getline(v:lnum - 1)[0] !~# '[a-zA-Z#]'
    return '>1'
  endif

  return '='
endfunction
