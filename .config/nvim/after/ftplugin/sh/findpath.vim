setlocal isfname+={,}

setlocal includeexpr=ShIncludeexpr(v:fname)

function! ShIncludeexpr(fname) abort
  return substitute(a:fname, '[{}]', '', 'g')
endfunction
