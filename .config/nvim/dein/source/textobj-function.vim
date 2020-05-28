" From: textobj.toml
" Repo: kana/vim-textobj-function

let g:textobj_function_no_default_key_mappings = 1

" " TODO: ']f' for cursorposition to inside of function.
" " default ']f' and so kind will work the same as 'gf'
" nnoremap ]f
" xnoremap ]f
" nnoremap [f
" xnoremap [f

augroup myTextObjFunctionSo
  if exists('#myTextObjFunctionSo') | au! myTextObjFunctionSo
  endif
  au FileType vim omap <buffer> if <Plug>(textobj-function-i)
  au FileType vim omap <buffer> af <Plug>(textobj-function-A)
  au FileType vim omap <buffer> iF <Plug>(textobj-function-I)
  au FileType vim xmap <buffer> if <Plug>(textobj-function-i)
  au FileType vim xmap <buffer> af <Plug>(textobj-function-A)
  au FileType vim xmap <buffer> iF <Plug>(textobj-function-I)
augroup END
