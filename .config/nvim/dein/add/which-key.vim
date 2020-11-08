" TOML: default.toml
" Repo: liuchengxu/vim-which-key
" Another: source/which-key.vim

" Note: WhichKey '\u'` doesn't work on unknown reason.
" nnoremap <silent> \u :<C-u>WhichKey '\u'<CR>
nnoremap <silent> \u :<C-u>WhichKey! g:which_key_map['\u'] <CR>

