" TOML: default.toml
" Repo: liuchengxu/vim-which-key

nnoremap <silent> \u :<C-u>WhichKey '<Plug>Caser:'<CR>
xnoremap <silent> \u :<C-u>WhichKeyVisual '<Plug>Caser in Visual:'<CR>

" TODO: cnoremap <silent> <C-r><C-g>
nnoremap <silent> y<C-g>          :<C-u>WhichKey '<Plug>Yank Path:'<CR>
inoremap <silent> <C-r><C-g> <C-o>:<C-u>WhichKey '<Plug>Paste Path:'<CR>

nnoremap <silent> <space>g :<C-u>WhichKey '<Plug>Git:'<CR>
xnoremap <silent> <space>g :<C-u>WhichKey '<Plug>Git in Visual:'<CR>

nnoremap <silent> <space>z :<C-u>WhichKey '<Plug>FZF:'<CR>

nnoremap <silent> <space>h :<C-u>WhichKey '<Plug>GitHub:'<CR>
xnoremap <silent> <space>h :<C-u>WhichKey '<Plug>GitHub:'<CR>

nnoremap <silent> <space>b :<C-u>WhichKey '<Plug>OpenBrowser:'<CR>
xnoremap <silent> <space>b :<C-u>WhichKey '<Plug>OpenBrowser in Visual:'<CR>
nnoremap <silent> \b :<C-u>WhichKey '<Plug>OpenBrowser in Operator:'<CR>
xnoremap <silent> \b :<C-u>WhichKey '<Plug>OpenBrowser in Visual:'<CR>
