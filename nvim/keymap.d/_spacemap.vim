let s:mapleader = "\<space>"

"""" Clipboard
vmap <space>y "+y
vmap <space>d "+d
nmap <space>p "+p
vmap <space>P "+P
nmap <space>p "+p
nmap <space>P "+P

"" Save and Quit
nnoremap <space>w :<c-u>w!<CR>
nnoremap <space>q :<c-u>q<CR>
""" Open New
"" Stand-by a CloudNote
nnoremap <space>ne :<c-u>Defx          ~/CloudNote/
nnoremap <space>ns :<c-u>sp<cr>:Defx   ~/CloudNote/
nnoremap <space>nv :<c-u>vne<cr>:Defx  ~/CloudNote/
nnoremap <space>nb :<c-u>tabe<cr>:Defx ~/CloudNote/
"" Ready to edit
nnoremap <space>e  :<c-u>e 
nnoremap <space>vs :<c-u>vs 
nnoremap <space>sp :<c-u>sp 
nnoremap <space>be :<c-u>tabe 
"" Current File
nnoremap <space>.v :<c-u>vs .<CR>
nnoremap <space>.s :<c-u>sp .<CR>
nnoremap <space>.b :<c-u>tabe .<CR>
"" Terminal
if has('nvim')
  nnoremap <silent> <space>te :<c-u>         te<cr>i
  nnoremap <silent> <space>tb :<C-u>tabe<CR>:te<CR>i
  nnoremap <silent> <space>ts :<C-u>sp<CR>  :te<CR>i
  nnoremap <silent> <space>tv :<C-u>vs<CR>  :te<CR>i
endif
