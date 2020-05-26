setl fdm=expr fde=AgitDiffFoldExpr(v:lnum)
if exists('b:undo_ftplugin')
  let b:undo_ftplugin .= ' | '
else
  let b:undo_ftplugin = ''
endif
let b:undo_ftplugin .= 'setl fdm< fde<'


let s:file_compared = '^diff --git a/'
let s:lines_compared = '^@@.*@@'

function! AgitDiffFoldExpr(lnum) abort
  let line = getline(a:lnum)
  if line =~# s:file_compared
    return '>1'
  elseif line =~# s:lines_compared
    return '>2'
  endif

  return '='
endfunction
