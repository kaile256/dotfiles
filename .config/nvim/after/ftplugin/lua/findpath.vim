setlocal includeexpr=LuaIncludeExpr(v:fname)

function! LuaIncludeExpr(fname) abort
  let fname = a:fname
  let fname = substitute(fname, '\.', '/', 'g')
  return fname
endfunction

