let s:mapleader = "\<space>"

"" Save and Quit
nnoremap <space>w :w!<CR>
nnoremap <space>q :q<CR>
"" Reload
nnoremap <space>sc :so %<CR>
nnoremap <space>si :so $XDG_CONFIG_HOME/nvim/init.vim<CR>
" New Pane
nnoremap <space>vs :vs .<CR>
nnoremap <space>sp :sp .<CR>

"" Clipboard
vmap <space>y "+y
vmap <space>d "+d
nmap <space>p "+p
vmap <space>P "+P
nmap <space>p "+p
nmap <space>P "+P

if has('nvim')
  nnoremap <silent> <space>tt :<C-u>tabe<CR>:te<CR>i

  nnoremap <silent> <space>tn :<C-u>new<CR>:te<CR> i
  nnoremap <silent> <space>nt :<C-u>new<CR>:te<CR> i

  nnoremap <silent> <space>ts :<C-u>sp<CR>:te<CR> i
  nnoremap <silent> <space>st :<C-u>sp<CR>:te<CR> i

  nnoremap <silent> <space>tv :<C-u>vs<CR>:te<CR> i
  nnoremap <silent> <space>vt :<C-u>vs<CR>:te<CR> i
endif
