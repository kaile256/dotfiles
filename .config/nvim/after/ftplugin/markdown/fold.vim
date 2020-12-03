let s:pat_header1 = '^\s*\zs#\ze \S'
let s:pat_header = '^\s*\zs#\+\ze \S'
let s:pat_item   = '\d\\. \|[-*] '

setl fdm=expr fde=MarkdownFoldExpr(v:lnum)

if exists('b:undo_ftplugin')
  let b:undo_ftplugin .= ' | '
else
  let b:undo_ftplugin = ''
endif
let b:undo_ftplugin .= 'setl fdm< fde<'

function! s:has_multi_header1() abort
  let cnt = 0
  const fname = expand('%:p')
  const lines = readfile(fname)
  for line in lines
    let cnt += line =~# s:pat_header1
  endfor
  return cnt >= 2
endfunction

function! s:foldlevel_header(line) abort
  const b:has_multi_header1 = s:has_multi_header1()

  const header_level = matchstrpos(a:line, s:pat_header)[2]
  const modifier = b:has_multi_header1 == 0
  return header_level - modifier
endfunction

function! MarkdownFoldExpr(lnum) abort "{{{1
  let line = getline(a:lnum)
  let prev = getline(a:lnum - 1)
  let next = getline(a:lnum + 1)

  if line =~# s:pat_header
    return '>'. s:foldlevel_header(line)

  elseif line =~# '^```'
    if prev ==# ''
      return 'a1'
    endif
    return 's1'
  endif

  " elseif line =~# s:pat_item
  "   let lnum_item   = search(s:pat_item,   'Wbnz')
  "   let lnum_header = search(s:pat_header, 'Wbnz')

  " if lnum_item > 0 && indent(lnum_item) > indent(v:lnum)
  "  return 'a1'
  " endif

  " if lnum_header > 0
  "   let header = getline(lnum_header)
  "   return '>'. (s:foldlevel_header(lnum_header) + 1)
  " endif

  return '='
endfunction

