function! snip#general#space_or_newline(num) abort
  let cursor = matchadd('Cursor', '\%#')
  let nr = getchar()
  let char = nr ==# "\<S-lt>" ? '<' : nr2char(nr)
  call matchdelete(cursor)

  let priority = '${'. a:num .'}'
  let ret_space = ' '. priority .' '
  let ret_newline = char . priority ."\n"

  if char !~# '\n\|\r'
    let ret_newline = "\n". ret_newline
  endif

  return char ==# ' ' ? ret_space : ret_newline
endfunction
