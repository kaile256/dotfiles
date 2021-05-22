" TOML: operator.toml
" Repo: tommcdo/vim-exchange
" Another: source/exchange.vim

" Note: all the mappings are dot-repeatable.
xmap \c <Plug>(Exchange)

" Operator
nmap \c <Plug>(Exchange)
nmap \cc <Plug>(ExchangeLine)
nmap \C <Plug>(Exchange)$

nmap \c<C-h> <Plug>(ExchangeClear)
xmap \c<C-h> <Plug>(ExchangeClear)
