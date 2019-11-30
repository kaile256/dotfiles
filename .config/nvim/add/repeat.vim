" From: extension.toml
" Repo: tpope/vim-repeat

" Note: make lazy load for this plugin.
nmap .     <Plug>(RepeatDot)

nmap u     <Plug>(RepeatUndo)zv
nmap <c-r> <Plug>(RepeatRedo)zv
"nmap U <Plug>(RepeatUndoLine)zv

"imap <a-.>   <esc><Plug>(RepeatDot)zv
"imap <a-u>   <esc><Plug>(RepeatUndo)zv
"imap <a-c-r> <esc><Plug>(RepeatRedo)zv
"imap <a-U>   <esc><Plug>(RepeatUndoLine)zv

" For: keeps me in insert mode.
" Note: <c-o><Plug>(RepeatUndo/Redo) works wrong
" Note: using 'gi' on '<c-o>u' makes complication.
inoremap <c-o>u     <esc>ua
inoremap <c-o><c-r> <esc><c-r>i
