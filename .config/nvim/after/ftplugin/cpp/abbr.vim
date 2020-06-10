inoreabbrev <buffer> ll long long

" '#' starts return `E474: Invalid argument`
function! s:expand_macro(expand, abbr) abort
  if getline('.') =~# '^\s*#'
    return a:expand
  endif
  return a:abbr
endfunction

inoreabbrev <expr><buffer> in  <SID>expand_macro('include', 'in')
inoreabbrev <expr><buffer> inc <SID>expand_macro('include', 'inc')
inoreabbrev <expr><buffer> de  <SID>expand_macro('define',  'de')
inoreabbrev <expr><buffer> def <SID>expand_macro('define',  'def')

