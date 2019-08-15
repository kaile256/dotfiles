"" neosnippet.vim
let g:neosnippet#snippets_directory = '~/.config/nvim/config.d/data.d'
let g:neosnippet#enable_snipmate_compatibility = 1

imap <C-s> <Plug>(neosnippet_expand_or_jump)
smap <C-s> <Plug>(neosnippet_expand_or_jump)
xmap <C-s> <Plug>(neosnippet_expand_target)

nnoremap <a-s>p :NeoSnippetEdit <cr>
nnoremap <a-s><a-p> :NeoSnippetEdit <cr>
