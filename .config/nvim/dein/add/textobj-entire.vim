" TOML: textobj.toml
" Repo: kana/vim-textobj-entire
" Another: post/textobj-entire.vim

" entire-i excludes empty lines both before and after the codes;
" entire-e incluses the empty lines
omap i<CR> <Plug>(textobj-entire-i)
omap a<CR> <Plug>(textobj-entire-i)

xmap i<CR> <Plug>(textobj-entire-i)
xmap a<CR> <Plug>(textobj-entire-i)
