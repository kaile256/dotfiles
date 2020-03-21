" From: textobj.toml
" Repo: kana/vim-textobj-function

let g:textobj_function_no_default_key_mappings = 1

" " TODO: ']f' for cursorposition to inside of function.
" " default ']f' and so kind will work the same as 'gf'
" nnoremap ]f
" xnoremap ]f
" nnoremap [f
" xnoremap [f

augroup myTextObjFunctionSource
  if exists('#myTextObjFunctionSource')
    au! myTextObjFunctionSource
  endif
  au FileType vim omap <buffer> af <Plug>(textobj-function-a)zv
  au FileType vim omap <buffer> if <Plug>(textobj-function-i)zv
  au FileType vim omap <buffer> aF <Plug>(textobj-function-A)zv
  au FileType vim omap <buffer> iF <Plug>(textobj-function-I)zv
  au FileType vim xmap <buffer> af <Plug>(textobj-function-a)zv
  au FileType vim xmap <buffer> if <Plug>(textobj-function-i)zv
  au FileType vim xmap <buffer> aF <Plug>(textobj-function-A)zv
  au FileType vim xmap <buffer> iF <Plug>(textobj-function-I)zv
augroup END
