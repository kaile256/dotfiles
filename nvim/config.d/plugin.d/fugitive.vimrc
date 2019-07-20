""" Status
nnoremap <silent> <space>gs :<c-u>Gstatus<cr>
""" Diff
nnoremap <silent> <space>gd :<c-u>Gvdiffsplit<cr>
""" Blame
nnoremap <silent> <space>gb :<c-u>Gblame<cr>
""" Log
nnoremap <silent> <space>gl :<c-u>Glog<cr>

""" Add && commit
nnoremap <space>g' :<c-u>Gw<cr>:Gcommit -m''<Left>
nnoremap <space>g" :<c-u>Gw<cr>:Gcommit -m""<Left>
""" Add && status
nnoremap <silent> <space>ga :<c-u>Gw<cr>:Gstatus<cr>
""" Pull
nnoremap <silent> <space>pl :<c-u>Gpull<cr>
""" Push
nnoremap <silent> <space>ps :<c-u>Gpush<cr>

""" Grep
nnoremap <space>gg :<c-u>Ggrep --color --all-match --ignore-case 
"" Help
nnoremap <space>gh :<c-u>Ggrep --pager<cr>
