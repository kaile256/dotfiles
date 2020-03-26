" From: appearance.toml
" Repo: t9md/vim-quickhl

"let g:quickhl_manual_colors = [
"      \ "gui=bold ctermfg=16  ctermbg=153 guifg=#ffffff guibg=#0a7383",
"      \ "gui=bold ctermfg=7   ctermbg=1   guibg=#a07040 guifg=#ffffff",
"      \ "gui=bold ctermfg=7   ctermbg=2   guibg=#4070a0 guifg=#ffffff",
"      \ "gui=bold ctermfg=7   ctermbg=3   guibg=#40a070 guifg=#ffffff",
"      \ ]

" no highlight on cword on CursorMoved
let g:quickhl_cword_enable_at_startup = 0

nmap m* <Plug>(quickhl-manual-this-whole-word)
xmap m* <Plug>(quickhl-manual-this-whole-word)

nmap m<c-h> <Plug>(quickhl-manual-reset)
xmap m<c-h> <Plug>(quickhl-manual-reset)
nmap m<BS> <Plug>(quickhl-manual-reset)
xmap m<BS> <Plug>(quickhl-manual-reset)

nmap m <Plug>(operator-quickhl-manual-this-motion)
