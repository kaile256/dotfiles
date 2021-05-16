" TOML: default.toml
" Repo: chinnkarahoi/vim-session-tree

nnoremap <silent> <C-w>u     <Cmd>SessionUndo<CR>
nnoremap <silent> <C-w>U     <Cmd>SessionRedo<CR>

" Note: Leave <C-w>r to go to reference, and :SessionRestore is supposed to be
" used at startup from shell according to its README.
" nnoremap <silent> <C-w>r     <Cmd>SessionRedo<CR>
" nnoremap <silent> <C-w><C-r> <Cmd>SessionRedo<CR>
" nnoremap <silent> <C-w>U     <Cmd>SessionRestore<CR>
