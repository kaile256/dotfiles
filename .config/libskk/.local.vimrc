" if expand('%:e') ==# 'json'
"   setlocal ft=jsonc
" endif

setlocal path^=/usr/share/libskk/**
setlocal suffixesadd=.json

setlocal includeexpr=SkkIncludeExpr(v:fname)
function! SkkIncludeExpr(fname) abort
  return substitute(a:fname, '/', '/keymap/', '') .'.json'
endfunction

