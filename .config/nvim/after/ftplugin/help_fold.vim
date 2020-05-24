setl fdm=expr fde=HelpFoldExpr(v:lnum)

if exists('b:undo_ftplugin')
  let b:undo_ftplugin .= ' | '
else
  let b:undo_ftplugin = ''
endif
let b:undo_ftplugin .= 'setl fdm< fde<'

let s:pat_tag_line = '\s\+\*\S\+\*\s*$'
let s:pat_index_line = '\(\d\+\.\w\+|\u[ A-Z]\+\)\s\+\*.*\*\s*$'

let s:pat_main_separator = '^=\+$'
let s:pat_sub_separator = '^-\+$'
let s:pat_either_separator = '^[-=]\+$'

let s:has_main_separator = search(s:pat_main_separator, 'nbw') > 0
let s:has_sub_separator = search(s:pat_sub_separator, 'nbw') > 0
let s:has_both_separators = s:has_main_separator && s:has_sub_separator

function! HelpFoldExpr(lnum) abort "{{{1
  let line = getline(a:lnum)
  let prev = getline(a:lnum - 1)
  let next = getline(a:lnum + 1)

  if line =~# s:pat_index_line
        \ && prev !~# s:pat_either_separator
        \ && next !~# s:pat_either_separator
        \ && next !~# s:pat_index_line

    if s:has_main_separator
      return '>2'
    elseif s:has_sub_separator
      return '>3'
    endif

    return '>1'

  elseif line =~# s:pat_main_separator && prev !~# s:pat_index_line
    " index under line
    return '>1'
  elseif line =~# s:pat_sub_separator && prev !~# s:pat_index_line
    return '>2'
  endif

  if line =~# s:pat_index_line && next =~# s:pat_main_separator
    " index over line
    return '>1'
  elseif line =~# s:pat_index_line && next =~# s:pat_sub_separator
    return '>2'

  elseif line =~# s:pat_tag_line
        \ && line !~# '^\s*\u\+'
        \ &&  prev !~# s:pat_tag_line
    if prev =~# s:pat_either_separator
      return '='

    elseif s:has_both_separators
      return '>3'
    endif

    return '>2'
  endif

  return '='
endfunction
