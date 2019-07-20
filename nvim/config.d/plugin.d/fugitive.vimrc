" add && commit
nnoremap <space>gw :<c-u>Gw<cr>:Gcommit -m''<Left>
" add && status
nnoremap <space>ga :<c-u>Gw<cr>:Gstatus<cr>
" diff
nnoremap <silent> <space>gd :<c-u>Gvdiffsplit<cr>
" blame
nnoremap <silent> <space>gb :<c-u>Gblame<cr>
" status
nnoremap <silent> <space>gs :<c-u>Gstatus<cr>
" log
nnoremap <silent> <space>gl :<c-u>Glog<cr>

" grep
nnoremap <space>gg :<c-u>Ggrep --color --all-match --ignore-case 

" pull
nnoremap <silent> <space>pl :<c-u>Gpull<cr>
" push
nnoremap <silent> <space>ps :<c-u>Gpush<cr>
