" TOML: operator.toml
" Repo: hauleth/sad.vim

nmap <space>n <Plug>(sad-search-forward)
nmap <space>N <Plug>(sad-search-backward)

nmap cr <Plug>(sad-change-forward)
nmap cR <Plug>(sad-change-backward)

" Visual mode
xmap s <Plug>(sad-change-forward)
xmap S <Plug>(sad-change-backward)
