" From: motion.toml
" Repo: junegunn/vim-easy-align

" Mnemonic: Queue Up!
nmap \q <Plug>(EasyAlign)
xmap \q <Plug>(EasyAlign)

" TODO: not limited to cursorline, but let it behave as an operator
nnoremap <silent> <Plug>(EasyAlign-on-space) :EasyAlign<cr>$*<space>
xnoremap <silent> <Plug>(EasyAlign-on-space) :EasyAlign<cr>$*<space>

" Space Adjustment; limited only to space adjustment.
" On Selected Area;
xmap \Q        <Plug>(EasyAlign-on-space)
xmap \q<space> <Plug>(EasyAlign-on-space)
" Line-wise;
nmap \Q        <Plug>(EasyAlign-on-space)
nmap \q<space> <Plug>(EasyAlign-on-space)
