function! snip#neosnippets#aliases() abort
  let snippet = substitute(getline(search('^snippet\s\+\S\+', 'nbW')),
        \ '^snippet\s\+', '', 'g')
  let match_list = [
        \ '..',
        \ '...',
        \
        \ '.\{-}_.',
        \ '.\{-}_.{2}',
        \
        \ ['.', '_\zs.'],
        \ ['.', '_\zs.\{2}'],
        \ ['.', '_\zs.', '_.\{-}_\zs.'],
        \ ]

  let aliases = []
  for ma in match_list
    if type(ma) == type("")
        let alias = matchstr(snippet, ma)
      elseif type(ma) == type([])
      let alias = ''
      for m in ma
        let alias .= matchstr(snippet, m)
      endfor
    endif
    call add(aliases, alias)
  endfor

  return join(aliases)
endfunction
