setlocal includeexpr=LspconfigIndentexpr(v:fname)

function! LspconfigIndentexpr(fname) abort
  " Complete paths to the lspconfig's default configs.
  return './'. fnamemodify(a:fname, ':e')
endfunction
