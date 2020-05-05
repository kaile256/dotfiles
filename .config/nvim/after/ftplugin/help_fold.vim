setl fdm=expr fde=HelpFoldExpr()

if exists('b:undo_ftplugin')
  let b:undo_ftplugin .= ' | '
else
  let b:undo_ftplugin = ''
endif
let b:undo_ftplugin .= 'setl fdm< fde<'

function! HelpFoldExpr() abort
  let line = getline(v:lnum)
  let prev = getline(v:lnum - 1)
  let next = getline(v:lnum + 1)

  if line =~# '^=\+$' && prev !~# '\u[A-Z ]\+\s\+\*.*\*\s*$'
    " index under line
    return '>1'
  elseif line =~# '^-\+$' && prev !~# '\u[A-Z ]\+\s\+\*.*\*\s*$'
    return '>2'

  elseif line =~# '\u[A-Z ]\+\s\+\*.*\*\s*$' && next =~# '^=\+$'
    " index over line
    return '>1'
  elseif line =~# '\u[A-Z ]\+\s\+\*.*\*\s*$' && next =~# '^-\+$'
    return '>2'

  elseif line =~# '\s\+\*\S\+\*\s*$'
        \ && line !~# '^\s*\u\+'
        \ &&  prev !~# '\s\+\*\S\+\*\s*$'
    return '>3'
  endif

  return '='
endfunction
