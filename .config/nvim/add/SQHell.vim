" From: ext.toml
" Repo: joereynolds/SQHell.vim
" Another: source/SQHell.vim
" Another: post/SQHell.vim

augroup mySQHelladd
  au!
  au BufRead *
        \ if getline(1) =~# '^SQLite format '
        \   | SQHShowDatabases
augroup END
