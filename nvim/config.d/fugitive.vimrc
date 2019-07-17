" add && commit
nnoremap <space>gw :<c-u>Gw<cr>:Gcommit -m''<Left>
" diff
nnoremap <silent> <space>gd :<c-u>Gvdiffsplit<cr>
" blame
nnoremap <silent> <space>gb :<c-u>Gblame<cr>
" status
nnoremap <silent> <space>gs :<c-u>Gstatus<cr>

" pull
nnoremap <silent> <space>gpl :<c-u>Gpull 
" push
nnoremap <silent> <space>gps :<c-u>Gpush 

