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
  " Mnemonic: Respect default [m/]m
  au FileType vim omap <buffer> im <Plug>(textobj-function-i)
  au FileType vim omap <buffer> am <Plug>(textobj-function-A)
  au FileType vim omap <buffer> iM <Plug>(textobj-function-I)
  au FileType vim xmap <buffer> im <Plug>(textobj-function-i)
  au FileType vim xmap <buffer> am <Plug>(textobj-function-A)
  au FileType vim xmap <buffer> iM <Plug>(textobj-function-I)
augroup END
