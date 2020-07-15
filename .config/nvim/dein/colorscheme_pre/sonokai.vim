" TOML: appearance.toml
" Repo: sainnhe/sonokai
" Another: source/sonokai.vim

augroup mySonokaiSo
  au ColorScheme sonokai ++nested call s:my_sonokai()
augroup END

function! s:my_sonokai() abort
  hi! Visual guibg=#5d6118

  hi! ColorColumn ctermbg=1 guibg=#5b6369

  hi! link phpIdentifier Type

  hi! link phpType         Green
  hi! link phpClasses      Green
  hi! link phpSuperglobals Green

  hi! DoppelgangerVirtualText ctermfg=64 guifg=#5f8700 cterm=italic gui=italic
endfunction
