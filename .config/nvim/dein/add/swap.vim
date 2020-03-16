" From: motion.toml
" Repo: machakann/vim-swap

let g:swap_no_default_key_mappings = 1

nmap - <Plug>(swap-prev)
nmap + <Plug>(swap-next)
"nmap - <Plug>(swap-interactive)

hi! link SwapCurrentItem DiffChange
hi! link SwapSelectedItem Visual
hi! link SwapItem Underlined

