" From: myplug.toml
" Repo: $DEIN_PRIVATE_HOME/vim-yaml-fold

let g:yamlfold#debug#enable = 1
let g:yamlfold#debug#lines  = 5

let g:yamlfold#disable_headers = 1
let g:yamlfold#disable_imports = 1
"let g:yamlfold#disable_indent  = 1
"let g:yamlfold#disable_pairs   = 1

let g:yamlfold#from_firstline = 1

let g:yamlfold#include_blanklines = 1

let g:yamlfold#active_filetypes = [
      \ 'eyaml',
      \ 'python',
      \ 'raml',
      \ 'sls',
      \ 'yaml',
      \ ]
