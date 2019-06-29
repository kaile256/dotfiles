let s:mapleader = "\<space>"

"""" Clipboard
vnoremap <space>y "+y
vnoremap <space>d "+d
nnoremap <space>p "+p
vnoremap <space>P "+P
nnoremap <space>p "+p
nnoremap <space>P "+P

"" Save and Quit
nnoremap <space>q :<c-u>q<CR>
nnoremap <space>w :<c-u>w!<CR>
nnoremap <space>z :<c-u>q!<CR>

"""" ACCESS
"" Help
nnoremap <space><space>h :<c-u>h 
"" Manpage
nnoremap <space><space>m :<c-u>Man 
"" Ready to edit
nnoremap <space><space>e :<c-u>e 
nnoremap <space><space>v :<c-u>vs 
nnoremap <space><space>s :<c-u>sp 
nnoremap <space><space>b :<c-u>tabe 

""" dir/netrw
"" defx.vim is faster than netrw
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

""" Terminal
if has('nvim')
  nnoremap <silent> <space>te :<c-u>        :te<cr>i
  nnoremap <silent> <space>ts :<C-u>sp<CR>  :te<CR>i
  nnoremap <silent> <space>tv :<C-u>vs<CR>  :te<CR>i
  nnoremap <silent> <space>tb :<C-u>tabe<CR>:te<CR>i
endif

"""" Plugin
"" Coc
nnoremap <space><space>c :<c-u>Coc
""" Git
nnoremap <silent> <space>tg :!tig blame +<c-r>=line('.')<cr> %<cr>:redraw!<cr>
"" Fugitive
nnoremap <silent> <space>gd :<c-u>Gdiff<cr>
nnoremap <silent> <space>gb :<c-u>Gblame<cr>

