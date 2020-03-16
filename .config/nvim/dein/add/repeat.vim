" From: default.toml
" Repo: tpope/vim-repeat

" Note: zv is implemented as default,
"       but fails to work in dein's autoload to lazy load
nmap .     <Plug>(RepeatDot)
nmap u     <Plug>(RepeatUndo)
nmap <c-r> <Plug>(RepeatRedo)
"nmap U <Plug>(RepeatUndoLine)

" Note: <c-o><Plug>(RepeatUndo/Redo) works wrong; only insert 'u' in text
" TODO: <c-o>u always jump cursor to the end of the last undone part
"inoremap <c-o>u     <c-o>u
inoremap <c-o>u     <esc>ua
"inoremap <c-o><c-r> <esc><c-r>i
inoremap <c-o><c-r> <c-o><c-r>
