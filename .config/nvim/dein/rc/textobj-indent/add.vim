" TOML: textobj.toml
" Repo: kana/vim-textobj-indent

let g:textobj_indent_no_default_key_mappings = 1

" Mnemonic: Block
omap ib <Plug>(textobj-indent-same-i)
omap ab <Plug>(textobj-indent-same-a)
xmap ib <Plug>(textobj-indent-same-i)
xmap ab <Plug>(textobj-indent-same-a)

omap iB <Plug>(textobj-indent-i)
omap aB <Plug>(textobj-indent-a)
xmap iB <Plug>(textobj-indent-i)
xmap aB <Plug>(textobj-indent-a)

