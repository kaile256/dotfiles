setlocal includeexpr=LspconfigIndentexpr(v:fname)

function! LspconfigIndentexpr(fname) abort
  " Complete paths to the lspconfig's default configs.
  return './ls/'. fnamemodify(a:fname, ':e')
endfunction
