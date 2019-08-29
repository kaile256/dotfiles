" From: Init.toml

" Command!;
command! GvdiffWithUnstaged :vert bel Git! diff --staged

" HISTORY
" Status
noremap <silent> <a-y>s     :<c-u>vert bot Gstatus<cr>
noremap <silent> <a-y><a-s> :<c-u>vert bot Gstatus<cr>

" Log
" Without `b#` `:Glog` with `:copen` fills previous window.
"# QuickFix -- Edit-History of current buffer.
noremap <silent> <a-y>l     :<c-u>bel Glog <bar> b# <bar> copen<cr>
noremap <silent> <a-y><a-l> :<c-u>bel Glog <bar> b# <bar> copen<cr>
"# QuickFix -- Commit-Log of git-repository.
noremap <silent> <a-y>c     :<c-u>bel Glog -- <bar> b# <bar> copen<cr>
noremap <silent> <a-y><a-c> :<c-u>bel Glog -- <bar> b# <bar> copen<cr>
"# QuickFix -- Commit-Log from master to current branch.
noremap <silent> <a-y>m     :<c-u>bel Glog master..HEAD --<bar> b# <bar> copen<cr>
noremap <silent> <a-y><a-m> :<c-u>bel Glog master..HEAD --<bar> b# <bar> copen<cr>

""" Diff
" !: On a Merge Conflict, do a 3-diff; otherwise the same as without bang.
noremap <silent> <a-y>d     :<c-u>Gvdiffsplit!<cr>gg
noremap <silent> <a-y><a-d> :<c-u>Gvdiffsplit!<cr>gg
noremap <silent> <a-y><a-u> :<c-u>GvdiffWithUnstaged<cr>
""" Blame
noremap <silent> <a-y>b     :<c-u>Gblame<cr>
noremap <silent> <a-y><a-b> :<c-u>Gblame<cr>

""" Read  # open buffer of last commited version.
noremap <silent> <a-y>r     :<c-u>Gread<cr>
noremap <silent> <a-y><a-r> :<c-u>Gread<cr>
""" Move  # rename current file and also the buffer.
noremap <silent> <a-y>n     :<c-u>Gmove<cr>
noremap <silent> <a-y><a-n> :<c-u>Gmove<cr>

""" Add only
noremap <silent> <a-y>a     :<c-u>Gw<cr>
noremap <silent> <a-y><a-a> :<c-u>Gw<cr>

""" Add && commit
noremap <a-y>'     :<c-u>Gw<cr>:Gcommit -m ''<Left>
noremap <a-y><a-'> :<c-u>Gw<cr>:Gcommit -m ''<Left>
noremap <a-y><a-"> :<c-u>Gw<cr>:Gcommit -m ""<Left>
noremap <a-y>"     :<c-u>Gw<cr>:Gcommit -m ""<Left>

""" Add && status
noremap <silent> <a-y>w     :<c-u>Gw<cr>:vert bot Gstatus<cr>
noremap <silent> <a-y><a-w> :<c-u>Gw<cr>:vert bot Gstatus<cr>

" Pull
noremap <silent> <a-y>l     :<c-u>Gpull<cr>
noremap <silent> <a-y><a-l> :<c-u>Gpull<cr>
" Push
noremap <silent> <a-y>h     :<c-u>Gpush<cr>
noremap <silent> <a-y><a-h> :<c-u>Gpush<cr>

""" Grep
" -I: no binary files
noremap <a-y>g     :<c-u>silent Ggrep  <bar> cw<Left><Left><Left><Left><Left>
noremap <a-y><a-g> :<c-u>silent Ggrep  <bar> cw<Left><Left><Left><Left><Left>
" show options
noremap <a-y>p     :<c-u>Ggrep --help<cr>
noremap <a-y><a-p> :<c-u>Ggrep --help<cr>

""" Others
noremap <a-y>o     :<c-u>Git checkout<space>
noremap <a-y><a-o> :<c-u>Git checkout<space>

function! s:commit_startinsert()
  if getline(1) == ''
    if getline(2) == '# Please enter the commit message for your changes. Lines starting'
      startinsert
    endif
  endif
endfunction

function! s:echo_fugitive_hotkeys()
  echomsg 'czw: stash --include-index'
endfunction

augroup OnFugitiveBuffer

  au!
  au FileType fugitive,git,gitcommit,fugitiveblame setl nonumber signcolumn= bt=quickfix
  "au FileType fugitive wincmd p | wincmd p
  au FileType gitcommit setl spell
  au FileType gitcommit call <SID>commit_startinsert()
  "au FileType fugitive  call <SID>echo_fugitive_hotkeys()

augroup END
