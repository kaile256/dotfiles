" From: motion.toml
" Repo: machakann/vim-swap

nmap _ <Plug>(swap-prev)
nmap + <Plug>(swap-next)
nmap - <Plug>(swap-interactive)

hi! link SwapCurrentItem DiffChange
hi! link SwapSelectedItem Visual
hi! link SwapItem Underlined

