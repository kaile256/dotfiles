"""" From: Init.toml

"""" GENERAL
augroup SpellCheckOnCommit
  au! FileType gitcommit setlocal spell
augroup END

"""" HISTORY
""" Status
nnoremap <silent> <a-y>s     :<c-u>Gstatus<cr>
nnoremap <silent> <a-y><a-s> :<c-u>Gstatus<cr>

""" Log
"# QuickFix -- Edit-History of current buffer.
nnoremap <silent> <a-y>l     :<c-u>Glog <bar> copen<cr>
nnoremap <silent> <a-y><a-l> :<c-u>Glog <bar> copen<cr>
"# QuickFix -- Commit-Log of git-repository.
nnoremap <silent> <a-y>c     :<c-u>Glog -- <bar> copen<cr>
nnoremap <silent> <a-y><a-c> :<c-u>Glog -- <bar> copen<cr>
"# QuickFix -- Commit-Log from master to current branch.
nnoremap <silent> <a-y>m     :<c-u>Glog master..HEAD -- <bar> copen<cr>
nnoremap <silent> <a-y><a-m> :<c-u>Glog master..HEAD -- <bar> copen<cr>

""" Diff
" !: On a Merge Conflict, do a 3-diff; otherwise the same as without bang.
nnoremap <silent> <a-y>d     :<c-u>Gvdiffsplit!<cr>
nnoremap <silent> <a-y><a-d> :<c-u>Gvdiffsplit!<cr>
""" Blame
nnoremap <silent> <a-y>b     :<c-u>Gblame<cr>
nnoremap <silent> <a-y><a-b> :<c-u>Gblame<cr>

""" Read  # open buffer of last commited version.
nnoremap <silent> <a-y>r     :<c-u>Gread<cr>
nnoremap <silent> <a-y><a-r> :<c-u>Gread<cr>
""" Move  # rename current file and also the buffer.
nnoremap <silent> <a-y>n     :<c-u>Gmove<cr>
nnoremap <silent> <a-y><a-n> :<c-u>Gmove<cr>

""" Add only
nnoremap <silent> <a-y>a     :<c-u>Gw<cr>
nnoremap <silent> <a-y><a-a> :<c-u>Gw<cr>
""" Add && commit
nnoremap          <a-y>'     :<c-u>Gw<cr>:Gcommit -m ''<Left>
nnoremap          <a-y><a-'> :<c-u>Gw<cr>:Gcommit -m ''<Left>
nnoremap          <a-y>"     :<c-u>Gw<cr>:Gcommit -m ""<Left>
""" Add && status
nnoremap <silent> <a-y>w     :<c-u>Gw<cr>:Gstatus<cr>
nnoremap <silent> <a-y><a-w> :<c-u>Gw<cr>:Gstatus<cr>
""" Pull
nnoremap <silent> <a-p>l     :<c-u>Gpull<cr>
nnoremap <silent> <a-p><a-l> :<c-u>Gpull<cr>
""" Push
nnoremap <silent> <a-p>s     :<c-u>Gpush<cr>
nnoremap <silent> <a-p><a-s> :<c-u>Gpush<cr>

""" Grep
" -I: no binary files
nnoremap <a-y>g     :<c-u>silent Ggrep  <bar> cw<Left><Left><Left><Left><Left>
nnoremap <a-y><a-g> :<c-u>silent Ggrep  <bar> cw<Left><Left><Left><Left><Left>
" show options
nnoremap <a-y>h     :<c-u>Ggrep --help<cr>
nnoremap <a-y><a-h> :<c-u>Ggrep --help<cr>

""" Others
nnoremap <a-y>o     :<c-u>Git checkout 
nnoremap <a-y><a-o> :<c-u>Git checkout 

