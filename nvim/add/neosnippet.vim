" From: tool.toml
" Repo: honza/vim-snippets/snippets

let g:neosnippet#snippets_directory = g:my_data . '/neosnippet'
let g:neosnippet#enable_snipmate_compatibility = 1

nnoremap <silent> <space>pe :<c-u>NeoSnippetEdit<cr>
nnoremap <silent> <space>ps :<c-u>sp  <bar>NeoSnippetEdit<cr>
nnoremap <silent> <space>pv :<c-u>vs  <bar>NeoSnippetEdit<cr>
nnoremap <silent> <space>pt :<c-u>tab sp <bar>NeoSnippetEdit<cr>

" Note: neosnippet activate only on insert mode or select mode.
nmap <expr> <c-\>
      \ neosnippet#expandable_or_jumpable() ?
      \ "g<c-h>\<Plug>(neosnippet_expand_or_jump)" : "\<c-\>"
vmap <expr> <c-\>
      \ neosnippet#expandable_or_jumpable() ?
      \ "<c-g>\<Plug>(neosnippet_expand_or_jump)" : "\<c-\>"
imap <expr> <c-\>
      \ neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)" : "\<c-\>"
smap <expr> <c-\>
      \ neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)" : "\<c-\>"

" Put Register on Snippet Expanding
snoremap <c-r><c-space> <space><BS><c-r>+
snoremap <c-r><space>   <space><BS><c-r>+
snoremap <c-r> <space><BS><c-r>
snoremap <c-h> <space><BS>

snoremap <a-h> <space><BS><esc>h
snoremap <a-j> <space><BS><esc>j
snoremap <a-k> <space><BS><esc>k
snoremap <a-l> <space><BS><esc>l
