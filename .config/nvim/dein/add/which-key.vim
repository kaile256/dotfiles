" TOML: default.toml
" Repo: liuchengxu/vim-which-key
" Another: source/which-key.vim

nnoremap <silent> \u :<C-u>WhichKey 'Caser '<CR>
xnoremap <silent> \u :<C-u>WhichKeyVisual 'Caser in Visual '<CR>

nnoremap <silent> y<C-g>          :<C-u>WhichKey 'Yank  Path '<CR>
inoremap <silent> <C-r><C-g> <C-o>:<C-u>WhichKey 'Paste Path '<CR>
