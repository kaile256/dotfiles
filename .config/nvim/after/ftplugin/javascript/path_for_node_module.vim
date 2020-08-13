setlocal include=from

" '@' represents  [a-zA-Z] and some others with which isalpha() returns true.
" setlocal isfname+=@-@

setlocal suffixesadd+=.js
setlocal suffixesadd+=.jsx
setlocal suffixesadd+=.ts
setlocal suffixesadd+=.tsx

setlocal includeexpr=NodeInclude(v:fname)

function! NodeInclude(fname) abort
  let webpack_tilde = '^\~'
  if a:fname =~# webpack_tilde
    " Ref: https://stackoverflow.com/a/52067127
    " -- StackOverflow: resolve modules via `gf` with a webpack tilde alias
    return substitute(substitute(a:fname,
          \ '^\~\/', 'resources/assets/js/', ''),
          \ '^\~sass/\\(.*\\)/\\(.*\\)$', 'resources/assets/sass/\\1/_\\2','')
  endif

  return substitute(a:fname, '^\/', '', '')
endfunction
