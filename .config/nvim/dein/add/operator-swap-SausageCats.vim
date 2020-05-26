" TOML: operator.toml
" Repo: SausageCats/vim-operator-swap
" Another: source/operator-swap-SausageCats.vim

" Have to do marking before swap
nmap \c <Plug>(operator-swap-area1)
nmap \C <Plug>(operator-swap-area2-swap)

xmap \c <Plug>(operator-swap-area1)
xmap \C <Plug>(operator-swap-area2-swap)

" Note: \cc forces \c to fail.
" nmap \cc V<Plug>(operator-swap-area1)
" nmap \CC V<Plug>(operator-swap-area2-swap)
" nmap \Cc V<Plug>(operator-swap-area2-swap)
