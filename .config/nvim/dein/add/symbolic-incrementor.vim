" TOML: public.toml
" Repo: kaile256/vim-symbolic-incrementor

let g:symbolicInc#no_default_mappings = 1
let g:symbolicInc#disable_integration_switch = 1

nmap \<C-a> <Plug>(symbolicInc-increment)
nmap \<C-x> <Plug>(symbolicInc-decrement)

nmap g<C-a> <Plug>(symbolicInc-increment-sync)
nmap g<C-x> <Plug>(symbolicInc-decrement-sync)

