setl fdm=expr fde=HelpFoldExpr(v:lnum)

if exists('b:undo_ftplugin')
  let b:undo_ftplugin .= ' | '
else
  let b:undo_ftplugin = ''
endif
let b:undo_ftplugin .= 'setl fdm< fde<'

let s:pat_tag_line = '\s\+\*\S\+\*\s*$'
let s:pat_main_index_line = '^\(\d\+\.\|\u\).\+\s\+\*.*\*\s*$'
let s:pat_sub_index_line = '\~$'

let s:pat_main_separator = '^=\+$'
let s:pat_sub_separator = '^-\+$'
let s:pat_either_separator = '^[-=]\+$'

let s:lnum_first_section_start = search(s:pat_either_separator, 'nw')

" Note: flag 'W' for search() doesn't work exceptedly; it seems to search from
" the top of a buffer.
let s:has_sub_index_line = search(s:pat_sub_index_line, 'nbw') > 0
let s:has_main_separator = search(s:pat_main_separator, 'nbw') > 0
let s:has_sub_separator  = search(s:pat_sub_separator, 'nbw') > 0

let s:foldlevel_at_index =
      \  (s:has_main_separator ? 1 : 0)
      \ + (s:has_sub_separator ? 1 : 0)
      \ + (s:has_sub_index_line ? 1 : 0)
let s:foldlevel_at_tag = s:foldlevel_at_index + 1

function! HelpFoldExpr(lnum) abort "{{{1
  let line = getline(a:lnum)
  let prev = getline(a:lnum - 1)
  let next = getline(a:lnum + 1)

  if line =~# s:pat_main_index_line
        \ && prev !~# s:pat_either_separator
        \ && next !~# s:pat_either_separator
        \ && prev !~# s:pat_main_index_line

    return '>'. s:foldlevel_at_index

  elseif prev =~# s:pat_main_separator
    return '>1'
  elseif prev =~# s:pat_sub_separator
    return '>2'
  endif

  if next =~# s:pat_main_separator
    return '<1'
  elseif next =~# s:pat_sub_separator
    return '<2'

  elseif line =~# s:pat_tag_line
        \ && prev !~# s:pat_tag_line
    if prev =~# s:pat_either_separator
      return '='
    endif

    return '>'. s:foldlevel_at_tag

  elseif a:lnum < s:lnum_first_section_start
    return '0'
  endif

  return '='
endfunction
