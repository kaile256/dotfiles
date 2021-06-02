finish
" Use `:Startuptime` of tweekmonster/startuptime.vim instead.

if exists('b:undo_ftplugin')
  let b:undo_ftplugin .= ' | '
else
  let b:undo_ftplugin = ''
endif
let b:undo_ftplugin .= 'setl fdm< fde<'
setlocal fdm=expr fde=LogFoldexpr(v:lnum)

let s:file_patterns = {
      \ 'vimprofile': '^FUNCTION',
      \ }

function! s:check_file_pattern() abort
  let lines = readfile(expand('%'), '', 20)
  for type in keys(s:file_patterns)
    let matches = filter(deepcopy(lines), 'v:val =~# s:file_patterns[type]')
    if len(matches) > 0
      let b:log_type = type
      return
    endif
  endfor
endfunction
call s:check_file_pattern()
delfunction s:check_file_pattern

let s:foldexpr = {}
function! s:foldexpr__vimprofile(lnum) abort dict
  let line = getline(a:lnum)

  if line =~# '^FUNCTION'
    return '>1'
  endif

  return '='
endfunction
let s:foldexpr.vimprofile = funcref('s:foldexpr__vimprofile')

function! LogFoldexpr(lnum) abort
  if get(b:, 'log_type', '') !=# ''
    return s:foldexpr[b:log_type](a:lnum)
  endif
  return 0
endfunction
