setl fdm=expr fde=GoFoldExpr(v:lnum)
if exists('b:undo_ftplugin')
  let b:undo_ftplugin .= ' | '
else
  let b:undo_ftplugin = ''
endif
let b:undo_ftplugin .= 'setl fdm< fde<'

let s:comment_start = '\/\*\(.*\*\/\)\@!'
let s:comment_end = '\(.*\*\/\)\@<!\*\/'
function! GoFoldExpr(lnum) abort
  let line = getline(a:lnum)
  let prev = getline(a:lnum - 1)
  let next = getline(a:lnum + 1)
  let prevnonblank = getline(prevnonblank(a:lnum - 1))
  let nextnonblank = getline(nextnonblank(a:lnum + 1))

  if line =~# '^\/\/' && prev =~# '^$'
    return '>1'

  elseif line =~# '^func ' && prev =~# '^$'
    return '>1'
  elseif line =~# '^type ' && prev =~# '^$'
        \ && (nextnonblank =~# '^const ' || line =~# ' struct {$')
    return '>1'
  elseif line =~# '^const ' && prevnonblank !~# '^type \|\/\/'
    return '>1'

    " elseif line =~# '=\s*`.*`\@!'
    "   return 'a1'
    " elseif line =~# '[^`]*`$'
    "   return 's1'

  elseif indent(a:lnum) > 0 && prev =~# '^$' && line !~# '".*"'
    " a block but not in import-block
    return '>'. (indent(a:lnum) / &shiftwidth + 1)

  elseif line =~# s:comment_start
    return 'a1'
  elseif line =~# s:comment_end
    return 's1'

  elseif line =~# '^import '
    return '>1'
  endif

  return '='
endfunction

