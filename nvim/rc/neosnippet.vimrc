""" From: tool.toml
"" neosnippet.vim
let g:neosnippet#snippets_directory = '~/.config/nvim/data/neosnippet'
let g:neosnippet#enable_snipmate_compatibility = 1

nnoremap <silent> <a-s>p     :NeoSnippetEdit <cr>
nnoremap <silent> <a-s><a-p> :NeoSnippetEdit <cr>

" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
"smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
" \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
