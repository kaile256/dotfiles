scriptencoding utf-8
" From: ext.toml
" Repo: joereynolds/SQHell.vim
" Another: add/SQHell.vim
" Another: post/SQHell.vim

" Default: MySQL
"let g:sqh_provider = 'sqlite'

" Available: nosplit, split, smart
"   'nosplit' - Use the current buffer for every query.
"   'split' - Split for every query.
"   'smart' - Create one split and use this. If a query is executed in another
"       buffer, the results will show in the 'smart' buffer instead
"       (similar to Neoterm and friends).
"       Note: this option is a work in progress and bugs are expected.
" Default: nosplit
"let g:sqh_results_output = 'smart'

let g:sqh_connections = {
      \ 'default': {
      \   'database': '/home/kaile256/.config/google-chrome/Default/History'
      \   },
      \ 'postgres': {
      \   'user': 'root',
      \   'password': 'hunter2',
      \   'host': '45.104.23.67',
      \   'database': 'postgres'
      \   },
      \ 'mysql': {
      \   'user': $USER,
      \   'password': '',
      \   'host': 'localhost'
      \   },
      \ 'msql_database': {
      \   'user': 'root',
      \   'password': 'superman',
      \   'database': 'customers',
      \   'host': '46.105.58.32'
      \},
      \ 'live': {
      \   'user': 'root',
      \   'password': 'gdfgee6£"^f',
      \   'host': '45.211.32.521'
      \   },
      \ }

