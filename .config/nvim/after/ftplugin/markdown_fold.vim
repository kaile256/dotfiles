setl fdm=expr fde=MarkdownFoldExpr()

if exists('b:undo_ftplugin')
  let b:undo_ftplugin .= ' | '
else
  let b:undo_ftplugin = ''
endif
let b:undo_ftplugin .= 'setl fdm< fde<'

function! MarkdownFoldExpr() abort "{{{1
  let line = getline(v:lnum)
  if line =~# '^\s*#\+ [^#]'
    " no fold on the first level header
    return '>'. (matchstrpos(line, '#\+')[2] - 1)

  elseif line =~# '\`\`\`\.'
    return 'a1'
  elseif line ==# '\`\`\`'
    return 's1'

    " elseif line =~# '\d\+\. \|[-*] '
    "   " TODO: fix it
    "   return '>'. (indent(v:lnum) / 3 + 1)
  endif

  return '='
endfunction
