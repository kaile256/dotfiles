" From: ext.toml
" Repo: joereynolds/SQHell.vim
" Another: source/SQHell.vim
" Another: post/SQHell.vim

augroup mySQHellAdd
  au BufRead * exe getline(1) =~# '^SQLite format '
        \ ? execute('SQHShowDatabases')
        \ : ''
augroup END
