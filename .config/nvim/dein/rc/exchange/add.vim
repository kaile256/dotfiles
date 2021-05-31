" TOML: operator.toml
" Repo: tommcdo/vim-exchange

hi! link ExchangeRegion DiffChange

" Note: all the mappings are dot-repeatable.
xmap \c <Plug>(Exchange)

" Operator
nmap \c <Plug>(Exchange)
nmap \cc <Plug>(ExchangeLine)
nmap \C <Plug>(Exchange)$

nmap \c<C-c> <Plug>(ExchangeClear)
