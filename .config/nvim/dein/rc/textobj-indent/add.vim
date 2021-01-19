" TOML: textobj.toml
" Repo: kana/vim-textobj-indent

let g:textobj_indent_no_default_key_mappings = 1

" Mnemonic: Block
omap ii <Plug>(textobj-indent-same-i)
omap ai <Plug>(textobj-indent-same-a)
xmap ii <Plug>(textobj-indent-same-i)
xmap ai <Plug>(textobj-indent-same-a)

omap iI <Plug>(textobj-indent-i)
omap aI <Plug>(textobj-indent-a)
xmap iI <Plug>(textobj-indent-i)
xmap aI <Plug>(textobj-indent-a)

