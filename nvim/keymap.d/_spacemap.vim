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
nnoremap <space>[count] :<c-u>[count]<CR>

"""" ACCESS
"" Help
nnoremap <space><space>h :<c-u>h 
"" Ready to edit
nnoremap <space><space>e :<c-u>e 
nnoremap <space><space>v :<c-u>vs 
nnoremap <space><space>s :<c-u>sp 
nnoremap <space><space>b :<c-u>tabe 
"" Coc
nnoremap <space><space>c :<c-u>Coc

""" dir/netrw
"" root
nnoremap <silent> <space>- :<c-u>E<cr>
"" Current File
nnoremap <silent> <space>.e :<c-u>e    .<CR>
nnoremap <silent> <space>.v :<c-u>vs   .<CR>
nnoremap <silent> <space>.s :<c-u>sp   .<CR>
nnoremap <silent> <space>.b :<c-u>tabe .<CR>
"" init.vim
nnoremap <silent> <space>ie :<c-u>e    ~/.config/nvim<CR>
nnoremap <silent> <space>is :<c-u>sp   ~/.config/nvim<CR>
nnoremap <silent> <space>iv :<c-u>vs   ~/.config/nvim<CR>
nnoremap <silent> <space>ib :<c-u>tabe ~/.config/nvim<CR>
"" dein-toml(plugin list)
nnoremap <silent> <space>pe :<c-u>e    /home/kaile256/.config/nvim/dein.d<cr>
nnoremap <silent> <space>ps :<c-u>sp   /home/kaile256/.config/nvim/dein.d<cr>
nnoremap <silent> <space>pv :<c-u>vs   /home/kaile256/.config/nvim/dein.d<cr>
nnoremap <silent> <space>pb :<c-u>tabe /home/kaile256/.config/nvim/dein.d<cr>

""" Terminal
if has('nvim')
  nnoremap <silent> <space>te :<c-u>        :te<cr>i
  nnoremap <silent> <space>ts :<C-u>sp<CR>  :te<CR>i
  nnoremap <silent> <space>tv :<C-u>vs<CR>  :te<CR>i
  nnoremap <silent> <space>tb :<C-u>tabe<CR>:te<CR>i
endif
