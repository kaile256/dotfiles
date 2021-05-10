if exists('g:loaded_textobj_funcname') | finish | endif
let g:loaded_textobj_funcname = 1

onoremap <Plug>(textobj-get-funcname) :<C-u>call textobj#funcname#select()<CR>
xnoremap <Plug>(textobj-get-funcname) :<C-u>call textobj#funcname#select()<CR>

omap gf <Plug>(textobj-get-funcname)
xmap gf <Plug>(textobj-get-funcname)
