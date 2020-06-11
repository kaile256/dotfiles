setlocal fdl=0 fdm=expr fde=JsonFoldExpr(v:lnum)
if exists('b:undo_ftplugin')
  let b:undo_ftplugin .= ' | '
else
  let b:undo_ftplugin = ''
endif
let b:undo_ftplugin .= 'setl fdm< fde<'


let s:start_of_block = '\%[//].*[\[{]$'
let s:end_of_block = '\(".*\)\@<![\]}],\=$'
let s:blank_line = '^\s*$'

function! JsonFoldExpr(lnum) abort
  let line = getline(a:lnum)
  let next = getline(a:lnum + 1)
  let prev = getline(a:lnum - 1)

  if line =~# s:start_of_block
    " The first line equals to 0.
    return 'a'. (line(a:lnum) == 0 ? 1 : 1 + (prev =~# s:blank_line))
  elseif line =~# s:end_of_block
    return 's'. (1 + (next =~# s:blank_line))
  endif

  if prev =~# s:blank_line && next !~# s:blank_line
    return 'a1'

    " elseif next =~# s:blank_line && prev !~# s:blank_line
    "   return 's1'
  elseif line =~# s:blank_line
        \ && next !~# s:blank_line && prev !~# s:blank_line
    return 's1'
  endif

  return '='
endfunction
