function! NS_if(expr, ...) abort
  let pat = a:expr =~# '\\%#' ? a:expr : a:expr .'.\{-}\%#'
  if search(pat, 'bcWn')
    return ''
  elseif a:0 > 0
    return a:1
  endif
endfunction
