let s:plugin = 'OnelineConv'

function! onelineConv#vimscript(reg, ...) abort
  " especially for Vim script
  let text = getreg(a:reg)

  let sep = a:0 > 0 ? a:1 : s:set_separator(a:reg)
  let no_backslash_leader = substitute(text, '[\n\r]\s*\\', ' ', 'ge')
  let no_newline = s:join_newlines(no_backslash_leader, sep)
  return no_newline
endfunction

function! onelineConv#shscript(reg, ...) abort
  " especially for Bash script
  let text = getreg(a:reg)

  let sep = a:0 > 0 ? a:1 : s:set_separator(a:reg)
  let no_newline = s:join_newlines(text, sep)
  return no_newline
endfunction

function! s:set_separator(reg) abort "{{{1
  if match(getreg(a:reg), '[\n\r].') == -1 | return ' ' | endif
  echo 'What separator for @'. a:reg .':  '. substitute(getreg(a:reg), '[\n\r].*', ' ...', '')
  let char = getchar()
  let ret = char ==# "\<S-lt>" ? '<' : nr2char(char)
  if ret ==# "\<Esc>"
    throw s:plugin .': Abort'
  endif
  return ret
endfunction

function! s:join_newlines(text, sep) abort "{{{1
  let no_extra_spaces = substitute(a:text, '\s\+', ' ', 'ge')
  let list = split(no_extra_spaces, '[\n\r]\+')
  return join(list, a:sep)
endfunction
