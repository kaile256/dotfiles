" TOML: appearance.toml
" Repo: sainnhe/sonokai
" Another: post/sonokai.vim

set termguicolors

" let g:sonokai_style = 'andromeda'
let g:sonokai_style = 'atlantis' " lighter andromeda
" let g:sonokai_style = 'shusia' " more blue
" let g:sonokai_style = 'maia' " more black

" let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 1
let g:airline_theme = 'sonokai'

augroup mySonokaiSo
  if exists('#mySonokaiSo') | au! mySonokaiSo
  endif
  au ColorScheme sonokai ++nested call s:my_sonokai()
augroup END

function! s:my_sonokai() abort
  hi! link phpIdentifier Type

  hi! link phpType         Green
  hi! link phpClasses      Green
  hi! link phpSuperglobals Green
endfunction
