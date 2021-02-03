" TOML: default.toml
" Repo: liuchengxu/vim-which-key

nnoremap <silent> \u :<C-u>WhichKey 'Caser:'<CR>
xnoremap <silent> \u :<C-u>WhichKeyVisual 'Caser in Visual:'<CR>

" TODO: cnoremap <silent> <C-r><C-g>
nnoremap <silent> y<C-g>          :<C-u>WhichKey 'Yank Path:'<CR>
inoremap <silent> <C-r><C-g> <C-o>:<C-u>WhichKey 'Paste Path:'<CR>

nnoremap <silent> <space>g :<C-u>WhichKey 'Git:'<CR>
xnoremap <silent> <space>g :<C-u>WhichKey 'Git in Visual:'<CR>

nnoremap <silent> <space>z :<C-u>WhichKey 'FZF:'<CR>

nnoremap <silent> <space>h :<C-u>WhichKey 'GitHub:'<CR>
xnoremap <silent> <space>h :<C-u>WhichKey 'GitHub:'<CR>

