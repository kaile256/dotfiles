" add && commit
nnoremap <space>gw :<c-u>Gw<cr>:Gcommit -m''<Left>
cnoremap <space>gw :<c-u>Gw<cr>:Gcommit -m''<Left>
" diff
nnoremap <silent> <space>gd :<c-u>Gvdiffsplit<cr>
" blame
nnoremap <silent> <space>gb :<c-u>Gblame<cr>
" status
nnoremap <silent> <space>gs :<c-u>Gstatus<cr>
" log
nnoremap <silent> <space>gl :<c-u>Glog<cr>

" grep
nnoremap <space>gg :<c-u>Ggrep --color --all-match 

" pull
nnoremap <silent> <space>pl :<c-u>Gpull 
" push
nnoremap <silent> <space>ps :<c-u>Gpush 
