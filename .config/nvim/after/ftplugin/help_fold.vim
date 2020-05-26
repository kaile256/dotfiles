setl fdm=expr fde=HelpFoldExpr(v:lnum)

if exists('b:undo_ftplugin')
  let b:undo_ftplugin .= ' | '
else
  let b:undo_ftplugin = ''
endif
let b:undo_ftplugin .= 'setl fdm< fde<'

let s:pat_tag_line = '\s\+\*\S\+\*\s*$'
let s:pat_index_line = '\(\d\+\.\w\+|\u[ A-Z]\+\)\s\+\*.*\*\s*$'
let s:pat_subindex_line = '\~$'

let s:pat_main_separator = '^=\+$'
let s:pat_sub_separator = '^-\+$'
let s:pat_either_separator = '^[-=]\+$'

" Note: flag 'W' for search() doesn't work exceptedly.
let s:has_sub_index_line = {-> search(s:pat_subindex_line, 'nbw') > 0}
let s:has_main_separator = {-> search(s:pat_main_separator, 'nbw') > 0}
let s:has_sub_separator  = {-> search(s:pat_sub_separator, 'nbw') > 0}

function! HelpFoldExpr(lnum) abort "{{{1
  let line = getline(a:lnum)
  let prev = getline(a:lnum - 1)
  let next = getline(a:lnum + 1)

  let foldlevel_at_index = string(
        \  (s:has_main_separator() ? 1 : 0)
        \ + (s:has_sub_separator() ? 1 : 0)
        \ + (s:has_sub_index_line() ? 1 : 0)
        \ )
  let foldlevel_at_tag = foldlevel_at_index + 1

  if line =~# s:pat_index_line
        \ && prev !~# s:pat_either_separator
        \ && next !~# s:pat_either_separator
        \ && next !~# s:pat_index_line

    return '>'. foldlevel_at_index

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
    endif

    return '>'. foldlevel_at_tag
  endif

  return '='
endfunction
