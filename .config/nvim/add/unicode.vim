" From: insert.toml
" Repo: chrisbra/unicode.vim

" mappings are unique
" Mnemonic: Mark
imap <c-x>m     <Plug>(UnicodeComplete)
imap <c-x><c-m> <Plug>(UnicodeComplete)
" Override: default digraph insertion.
imap <c-k>      <Plug>(DigraphComplete)

command! UniName :UnicodeName
" ga: vim's default, Get Ascii, :echo the code in hex and octal
"imap <Plug>(UnicodeGA) "ga:
"nmap <Plug>(MakeDigraph) " <F4>
"xmap <Plug>(MakeDigraph) " <F4>
"nmap <Plug>(UnicodeSwapCompleteName) " \un
