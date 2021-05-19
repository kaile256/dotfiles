setlocal isfname+=(,),{,}

setlocal includeexpr=MakeIncludeexpr(v:fname)

function! MakeIncludeexpr(fname) abort
  return substitute(a:fname, '[(){}]', '', 'g')
endfunction
