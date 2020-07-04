" TOML: public.toml
" Repo: kaile256/vim-symbolic-incrementor

let g:symbolicInc#no_default_mappings = 1

nmap \<C-a> <Plug>(symbolicInc-increment)
nmap \<C-x> <Plug>(symbolicInc-decrement)

nmap <C-a> <Plug>(symbolicInc-increment-sync)
nmap <C-x> <Plug>(symbolicInc-decrement-sync)

