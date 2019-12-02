" From: appearance.toml
" Repo: t9md/vim-quickhl

"let g:quickhl_manual_colors = [
"      \ "gui=bold ctermfg=16  ctermbg=153 guifg=#ffffff guibg=#0a7383",
"      \ "gui=bold ctermfg=7   ctermbg=1   guibg=#a07040 guifg=#ffffff",
"      \ "gui=bold ctermfg=7   ctermbg=2   guibg=#4070a0 guifg=#ffffff",
"      \ "gui=bold ctermfg=7   ctermbg=3   guibg=#40a070 guifg=#ffffff",
"      \ ]

"let g:quickhl_manual_keywords._ = [
"      \ "finish",
"      \ {"pattern": '\s\+$', "regexp": 1 },
"      \ {"pattern": '\d\{1,3}\.\d\{1,3}\.\d\{1,3}\.\d\{1,3}', "regexp": 1 },
"      \ ]

"nmap <space>n <Plug>(quickhl-manual-this)
xmap <space>n <Plug>(quickhl-manual-this)
nmap <F9>     <Plug>(quickhl-manual-toggle)
xmap <F9>     <Plug>(quickhl-manual-toggle)

nmap <space>m <Plug>(quickhl-manual-reset)
xmap <space>m <Plug>(quickhl-manual-reset)

nmap <space>j <Plug>(quickhl-cword-toggle)

nmap <space>] <Plug>(quickhl-tag-toggle)

map <space>n <Plug>(operator-quickhl-manual-this-motion)
