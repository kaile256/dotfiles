setl fdm=expr fde=HelpFoldExpr()

if exists('b:undo_ftplugin')
  let b:undo_ftplugin .= ' | '
else
  let b:undo_ftplugin = ''
endif
let b:undo_ftplugin .= 'setl fdm< fde<'

function! HelpFoldExpr() abort
  let line = getline(v:lnum)
  let prevline = getline(v:lnum - 1)

  if line =~# '^=\+$'
    return '>1'
  elseif line =~# '^-\+$'
    return '>2'

  elseif line =~# '\s\+\*\S\+\*\s*$' && line !~# '^\s*\u\+'
        \ &&  prevline !~# '\s\+\*\S\+\*\s*$'
    "if getline(v:lnum - 1) =~# '^=\+$'
    "  return '='
    "elseif getline(v:lnum - 1) =~# '^-\+$'
    "  return '='
    "endif
    return '>3'
  endif

  return '='
endfunction
