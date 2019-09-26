" From: tool.toml
" Repo: tpope/vim-repeat

imap <a-.>   <esc><Plug>(RepeatDot)
imap <a-u>   <esc><Plug>(RepeatUndo)
imap <a-U>   <esc><Plug>(RepeatUndoLine)
imap <a-C-R> <esc><Plug>(RepeatRedo)

"" For: keeps me in insert mode. unnecessary?
"imap <c-o>u     <esc><Plug>(RepeatUndo)a
"imap <c-o><c-r> <esc><Plug>(RepeatRedo)i
