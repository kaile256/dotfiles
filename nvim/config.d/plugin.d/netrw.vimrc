"" defx.vim is faster than netrw

"""" VAR
" where .netrwhist is located.
let g:netrw_home = "$XDG_CACHE_HOME/nvim/netrw"
" 0:show all, including hidden files.
let g:netrw_hide = 0
" 'H':show bytes like 5K, 4M, 3G
let g:netrw_sizestyle ='H'
" 'v' opens on right.
let g:netrw_altv = 1
" 'o' opens on below.
let g:netrw_alto = 1
"let g:netrw_liststyle = 2 " always show tree view at first.

"""" KEYBIND
""" the Preceding dir.
"nnoremap <silent> <space>- :<c-u>E<cr>
""" Current File
"nnoremap <silent> <space>.e :<c-u>e    .<CR>
"nnoremap <silent> <space>.v :<c-u>vs   .<CR>
"nnoremap <silent> <space>.s :<c-u>sp   .<CR>
"nnoremap <silent> <space>.b :<c-u>tabe .<CR>
""" Home
"nnoremap <silent> <space>he :<c-u>e    ~<CR>
"nnoremap <silent> <space>hv :<c-u>vs   ~<CR>
"nnoremap <silent> <space>hs :<c-u>sp   ~<CR>
"nnoremap <silent> <space>hb :<c-u>tabe ~<CR>
""" Init.vim
"nnoremap <silent> <space>ie :<c-u>e    ~/.config/nvim<CR>
"nnoremap <silent> <space>is :<c-u>sp   ~/.config/nvim<CR>
"nnoremap <silent> <space>iv :<c-u>vs   ~/.config/nvim<CR>
"nnoremap <silent> <space>ib :<c-u>tabe ~/.config/nvim<CR>
""" Keymaps
"nnoremap <silent> <space>ke :<c-u>e    ~/.config/nvim/keymap.d<CR>
"nnoremap <silent> <space>ks :<c-u>sp   ~/.config/nvim/keymap.d<CR>
"nnoremap <silent> <space>kv :<c-u>vs   ~/.config/nvim/keymap.d<CR>
"nnoremap <silent> <space>kb :<c-u>tabe ~/.config/nvim/keymap.d<CR>
""" Plugin list: dein-toml
"nnoremap <silent> <space>pe :<c-u>e    /home/kaile256/.config/nvim/dein.d<cr>
"nnoremap <silent> <space>ps :<c-u>sp   /home/kaile256/.config/nvim/dein.d<cr>
"nnoremap <silent> <space>pv :<c-u>vs   /home/kaile256/.config/nvim/dein.d<cr>
"nnoremap <silent> <space>pb :<c-u>tabe /home/kaile256/.config/nvim/dein.d<cr>

