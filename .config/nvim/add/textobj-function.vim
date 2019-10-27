" From: textobj.toml
" Repo: kana/vim-textobj-function

let g:textobj_function_no_default_key_mappings = 1

augroup LetTextobjFuncOnlyWhenRequired
  au!
  au FileType vim omap <buffer> af  <Plug>(textobj-function-a)
  au FileType vim omap <buffer> if  <Plug>(textobj-function-i)
  au FileType vim omap <buffer> aF  <Plug>(textobj-function-A)
  au FileType vim omap <buffer> iF  <Plug>(textobj-function-I)
  au FileType vim xmap <buffer> af  <Plug>(textobj-function-a)
  au FileType vim xmap <buffer> if  <Plug>(textobj-function-i)
  au FileType vim xmap <buffer> aF  <Plug>(textobj-function-A)
  au FileType vim xmap <buffer> iF  <Plug>(textobj-function-I)
  " TODO: ']f' for cursorposition to inside of function.
  "nnoremap ]f
  "xnoremap ]f
  "nnoremap [f
  "xnoremap [f
augroup END
