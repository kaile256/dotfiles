" TOML: default.toml
" Repo: junegunn/vim-peekaboo
" Another: source/peekaboo.vim

nmap <expr> <Plug>(peekaboo-macro)    peekaboo#peek(v:count1, '@', 0)
nmap <expr> <Plug>(peekaboo-register) peekaboo#peek(v:count1, '"', 0)
xmap <expr> <Plug>(peekaboo-register) peekaboo#peek(v:count1, '"', 1)

imap <expr> <Plug>(peekaboo-register) peekaboo#peek(1, "\<c-r>", 0)

nmap @\ <Plug>(peekaboo-macro)

nmap "\ <Plug>(peekaboo-register)
xmap "\ <Plug>(peekaboo-register)
imap <c-r>\ <Plug>(peekaboo-register)
