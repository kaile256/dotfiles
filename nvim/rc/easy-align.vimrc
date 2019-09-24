" From: motion.toml
" Repo: junegunn/vim-easy-align

" Mnemonic: Queue Up!
nmap qu <Plug>(EasyAlign)
xmap qu <Plug>(EasyAlign)

nnoremap <silent> <Plug>(EasyAlign-on-space) :EasyAlign<cr>$*<space>
xnoremap <silent> <Plug>(EasyAlign-on-space) :EasyAlign<cr>$*<space>

" Space Adjustment; limited only to space adjustment.
" On Selected Area;
xmap qU <Plug>(EasyAlign-on-space)
" Line-wise;
nmap qU <Plug>(EasyAlign-on-space)
