function! NS_cpp_include() abort
  let ret = ''

  let pre = '#include'
  if search(pre. '.\{-}\%#', 'cnWb') == 0
    let ret .= pre .' '
  endif
  let fix = '<'
  if search(fix .'.\{-}\%#', 'cnWb') == 0
    let ret .= fix
  endif
  " if search('\%[#]in\%[clude <].\{-}\%#', 'cnWb')
  "   silent! d_
  " endif
  return ret
endfunction
