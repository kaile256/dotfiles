" From: operator.toml
" Repo: machakann/vim-swap

let g:swap_no_default_key_mappings = 1

nmap <BS>  <Plug>(swap-prev)
nmap <Del> <Plug>(swap-next)
"nmap - <Plug>(swap-interactive)

" wiser than sgur/vim-textobj-parameter
xmap i, <Plug>(swap-textobject-i)
xmap a, <Plug>(swap-textobject-a)
omap i, <Plug>(swap-textobject-i)
omap a, <Plug>(swap-textobject-a)

hi! link SwapCurrentItem DiffChange
hi! link SwapSelectedItem Visual
hi! link SwapItem Underlined

