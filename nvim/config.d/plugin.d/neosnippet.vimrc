"" neosnippet.vim
let g:neosnippet#snippets_directory = '~/.config/nvim/config.d/data.d'
let g:neosnippet#enable_snipmate_compatibility = 1

xmap <C-s> <Plug>(neosnippet_expand_target)

nnoremap <a-s>p     :NeoSnippetEdit <cr>
nnoremap <a-s><a-p> :NeoSnippetEdit <cr>

" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
"smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
" \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
