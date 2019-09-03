" From: tool.toml

let g:neosnippet#snippets_directory = '~/.config/nvim/data/neosnippet/'
let g:neosnippet#enable_snipmate_compatibility = 1

nnoremap <silent> <a-s>p     :NeoSnippetEdit <cr>
nnoremap <silent> <a-s><a-p> :NeoSnippetEdit <cr>

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
