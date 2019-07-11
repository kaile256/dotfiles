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
"" Tig
nnoremap <space>tg :silent! !tig blame +<c-r>=line('.')<cr> %<cr>:redraw!<cr>
"" Fugitive
nnoremap <silent> <space>gd :<c-u>Gdiff<cr>
nnoremap <silent> <space>gb :<c-u>Gblame<cr>

