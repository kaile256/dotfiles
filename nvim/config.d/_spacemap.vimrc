
"" NoHighlight
nnoremap <silent> <c-l> :noh<cr><c-l>

"""" Clipboard
" registor
nnoremap <space>y "+y
xnoremap <space>y "+y
nnoremap <space>d "+d
xnoremap <space>d "+d
" paste
nnoremap <space>p "+p
xnoremap <space>p "+p
nnoremap <space>P "+P
xnoremap <space>P "+P

""" Save and Quit
nnoremap <space>q :<c-u>q<CR>
nnoremap <space>w :<c-u>w!<CR>
nnoremap <space>z :<c-u>q!<CR>

"" Git
nnoremap <space>gw ':<c-u>w! | ! git add % && git commit -m ''<left>'

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

""" Tab Page
nnoremap <space>bp :tabprevious<cr>
nnoremap <space>bn :tabnext<cr>
nnoremap <space>bo :tabonly<cr>
nnoremap <space>bc :tabclose<cr>

""" Terminal
if has('nvim')
  nnoremap <silent> <space>te :<c-u>        :te<cr>i
  nnoremap <silent> <space>ts :<C-u>sp<CR>  :te<CR>i
  nnoremap <silent> <space>tv :<C-u>vs<CR>  :te<CR>i
  nnoremap <silent> <space>tb :<C-u>tabe<CR>:te<CR>i
endif
