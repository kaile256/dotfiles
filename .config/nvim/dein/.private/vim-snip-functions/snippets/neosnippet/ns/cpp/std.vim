function! s:exists_include(header) abort
  return search('#include\s\{-}'. a:header, 'nbW')
endfunction

function! s:make_sure_include(header) abort
  let exists = s:exists_include(a:header)

  if !exists
    call append(search('#include ', 'nW', 20), '#include '. a:header)
  endif

  return exists
endfunction

function! NS_cpp_std() abort "{{{1
  let prefix = search('using.\{-}std;', 'nbW') ? '' : 'std::'
  return prefix
endfunction

function! NS_cpp_cin() abort "{{{1
  if s:exists_include('<iostream>')
    let prefix = search('using.\{-}std', 'nbW') ? '' : 'std::'
    return prefix . 'cin >> ${1:N};'
  endif

  call s:make_sure_include('<cstdio>')
  return 'scanf("%${2:d}", &{1:a})'
endfunction

function! NS_cpp_cout() abort "{{{1
  if search('#include <iostream>', 'nbW')
    let prefix = search('using.\{-}std', 'nbW') ? '' : 'std::'
    return prefix . 'cout << ${1};'
  endif

  return 'printf("%${2:d}\n", &{1:a})'
endfunction
