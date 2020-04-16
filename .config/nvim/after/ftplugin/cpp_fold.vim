setl fdm=expr fde=CppFoldExpr()
if exists('b:undo_ftplugin')
  let b:undo_ftplugin .= ' | '
else
  let b:undo_ftplugin = ''
endif
let b:undo_ftplugin .= 'setl fdm< fde<'

function! CppFoldExpr() abort
  let line = getline(v:lnum)
  let prev = getline(v:lnum - 1)
  let next = getline(v:lnum + 1)

  if prev[0] =~# '^$'
        \ &&(line =~# '^#' || line =~# '^\/[/*]\v(\*\/)@!')
    return '>1'

  elseif line =~# '{\|\/\*$'
    return 'a1'
  elseif line =~# '}\|\*\/$'
    return 's1'
  endif

  return '='
endfunction
