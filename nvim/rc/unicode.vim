" From: insert.toml
" Repo: chrisbra/unicode.vim

" mappings are unique
" Mnemonic: Mark
imap <c-x>m     <Plug>(UnicodeComplete)
imap <c-x><c-m> <Plug>(UnicodeComplete)
" Override: default digraph insertion.
imap <c-k> <Plug>(DigraphComplete)

"nmap <Plug>(MakeDigraph) " <F4>
"xmap <Plug>(MakeDigraph) " <F4>
"nmap <Plug>(UnicodeSwapCompleteName) " \un
