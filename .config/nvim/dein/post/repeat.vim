" From: default.toml
" Repo: tpope/vim-repeat

" Note: <c-o><Plug>(RepeatUndo/Redo) works wrong; only insert 'u' in text
" TODO: <c-o>u always jump cursor to the end of the last undone part
inoremap <c-o>u     <esc>ua
inoremap <c-o><c-r> <c-o><c-r>

nmap <silent> .     <Plug>(RepeatDot)
nmap <silent> u     <Plug>(RepeatUndo)
nmap <silent> <C-R> <Plug>(RepeatRedo)
