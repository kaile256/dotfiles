let s:mapleader = "\<space>"

"" NoHighlight
noremap <silent> <space>nh :noh<cr>

"""" Clipboard
" registor
nnoremap <space>y "+y
vnoremap <space>y "+y
nnoremap <space>d "+d
vnoremap <space>d "+d
" paste
nnoremap <space>p "+p
vnoremap <space>p "+p
nnoremap <space>P "+P
vnoremap <space>P "+P

"" Save and Quit
nnoremap <space>q :<c-u>q<CR>
nnoremap <space>w :<c-u>w!<CR>
nnoremap <space>z :<c-u>q!<CR>

"""" ACCESS
"" History
nnoremap <space><space>/ :<c-r>q/<cr>
nnoremap <space><space>: :<c-r>q:<cr>
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
