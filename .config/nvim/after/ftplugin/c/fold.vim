setlocal fdm=expr fde=CppFoldExpr(v:lnum)

if exists('b:undo_ftplugin')
  let b:undo_ftplugin .= ' | '
else
  let b:undo_ftplugin = ''
endif
let b:undo_ftplugin .= 'setl fdm< fde<'

function! CppFoldExpr(lnum) abort
  let line = getline(a:lnum)
  let prev = getline(a:lnum - 1)
  let next = getline(a:lnum + 1)

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
