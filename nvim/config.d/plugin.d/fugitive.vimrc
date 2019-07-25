"""" From: Initial.toml
"""" HISTORY
""" Status
nnoremap <silent> <space>gs :<c-u>Gstatus<cr>

""" Log
"# QuickFix -- Edit-History of current buffer.
nnoremap <silent> <space>gl :<c-u>Glog <bar> copen<cr>
"# QuickFix -- Commit-Log of git-repository.
nnoremap <silent> <space>gc :<c-u>Glog -- <bar> copen<cr>
"# QuickFix -- Commit-Log from master to current branch.
nnoremap <silent> <space>gm :<c-u>Glog master..HEAD -- <bar> copen<cr>

""" Diff
nnoremap <silent> <space>gd :<c-u>Gvdiffsplit<cr>
""" Blame
nnoremap <silent> <space>gb :<c-u>Gblame<cr>

""" Read  # open buffer of last commited version.
nnoremap <silent> <space>gr :<c-u>Gread<cr>
""" Move  # rename current file and also the buffer.
nnoremap <silent> <space>gn :<c-u>Gmove<cr>

""" Add only
nnoremap <silent> <space>ga :<c-u>Gw<cr>
""" Add && commit
nnoremap <space>g' :<c-u>Gw<cr>:Gcommit -m ''<Left>
nnoremap <space>g" :<c-u>Gw<cr>:Gcommit -m ""<Left>
""" Add && status
nnoremap <silent> <space>gw :<c-u>Gw<cr>:Gstatus<cr>
""" Pull
nnoremap <silent> <space>pl :<c-u>Gpull<cr>
""" Push
nnoremap <silent> <space>ps :<c-u>Gpush<cr>

""" Grep
" -I: no binary files
nnoremap <space>gg :<c-u>silent Ggrep  <bar> cw<Left><Left><Left><Left><Left>
" show options
nnoremap <space>gh :<c-u>Ggrep --help<cr>

""" Others
nnoremap <space>go :<c-u>Git checkout 

