" From: ext.toml
" Repo: joereynolds/SQHell.vim
" Another: source/SQHell.vim
" Another: post/SQHell.vim

augroup mySQHellAdd
  au BufRead *
        \ if getline(1) =~# '^SQLite format '
        \   | SQHShowDatabases
        \ | endif
augroup END
