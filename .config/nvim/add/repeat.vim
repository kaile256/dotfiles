" From: extension.toml
" Repo: tpope/vim-repeat

" TODO: make lazy load for this plugin.
" Note: zv is implemented as default,
"       but fails to work in dein's autoload to lazy load
nmap .     <Plug>(RepeatDot)
nmap u     <Plug>(RepeatUndo)
nmap <c-r> <Plug>(RepeatRedo)
"nmap U <Plug>(RepeatUndoLine)

"imap <a-.>   <esc><Plug>(RepeatDot)
"imap <a-u>   <esc><Plug>(RepeatUndo)
"imap <a-c-r> <esc><Plug>(RepeatRedo)
"imap <a-U>   <esc><Plug>(RepeatUndoLine)

" For: keeps me in insert mode.
" Note: <c-o><Plug>(RepeatUndo/Redo) works wrong
" Note: using 'gi' on '<c-o>u' makes complication.
inoremap <c-o>u     <esc>ua
inoremap <c-o><c-r> <esc><c-r>i
