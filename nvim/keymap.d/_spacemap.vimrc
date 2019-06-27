let s:mapleader = "\<space>"

"""" Clipboard
vmap <space>y "+y
vmap <space>d "+d
nmap <space>p "+p
vmap <space>P "+P
nmap <space>p "+p
nmap <space>P "+P

"" Save and Quit
nnoremap <space>w :w!<CR>
nnoremap <space>q :q<CR>
"" Reload
nnoremap <space>so :so $XDG_CONFIG_HOME/nvim/init.vim<CR>
""" Open New
"" Stand-by a CloudNote
nnoremap <space>ne :e    ~/CloudNote/
nnoremap <space>ns :sp   ~/CloudNote/
nnoremap <space>nv :vs   ~/CloudNote/
nnoremap <space>nb :tabe ~/CloudNote/
"" Ready to edit
nnoremap <space>e :e 
nnoremap <space>vs :vs 
nnoremap <space>sp :sp 
nnoremap <space>be :tabe 
"" Current File
nnoremap <space>.v :vs .<CR>
nnoremap <space>.s :sp .<CR>
nnoremap <space>.b :tabe .<CR>
"" Terminal
if has('nvim')
  nnoremap <silent> <space>tb :<C-u>tabe<CR>:te<CR>i
  nnoremap <silent> <space>ts :<C-u>sp<CR>:te<CR>i
  nnoremap <silent> <space>tv :<C-u>vs<CR>:te<CR>i
endif
