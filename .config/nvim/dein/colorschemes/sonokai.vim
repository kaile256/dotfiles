" TOML: appearance.toml
" Repo: sainnhe/sonokai
" Another: source/sonokai.vim

augroup mySonokaiSo
  if exists('#mySonokaiSo') | au! mySonokaiSo
  endif
  au ColorScheme sonokai ++nested call s:my_sonokai()
augroup END

function! s:my_sonokai() abort
  hi! Visual guibg=#5d6118

  hi! link phpIdentifier Type

  hi! link phpType         Green
  hi! link phpClasses      Green
  hi! link phpSuperglobals Green
endfunction
