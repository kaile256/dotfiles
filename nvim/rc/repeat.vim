" From: tool.toml
" Repo: tpope/vim-repeat

" Note: make lazy load for this plugin.
"nmap . <Plug>(RepeatDot)
"nmap u <Plug>(RepeatUndo)
"nmap U <Plug>(RepeatUndoLine)
"nmap <C-R> <Plug>(RepeatRedo)

imap <a-.>   <esc><Plug>(RepeatDot)
imap <a-u>   <esc><Plug>(RepeatUndo)
imap <a-U>   <esc><Plug>(RepeatUndoLine)
imap <a-C-R> <esc><Plug>(RepeatRedo)

" For: keeps me in insert mode.
" Note: <c-o><Plug>(RepeatUndo/Redo) works wrong.
inoremap <c-o>u     <esc>ua
inoremap <c-o><c-r> <esc><c-r>i
