" From: fugitive.toml
" Repo: sodapopcan/vim-twiggy
" Ref: add/merginal.vim
" Another: add/twiggy.vim

"let g:twiggy_enable_remote_delete = 1

" just makes 'gl' available on twiggy-buffer
let g:twiggy_git_log_command = 1

let g:twiggy_split_method = 'vert bot'
let g:twiggy_num_columns = 35
"let g:twiggy_group_locals_by_slash = 0

" Values can be 'aplha', 'mru', 'date' or 'track'
let g:twiggy_close_on_fugitive_command = 1
let g:twiggy_local_branch_sort = 'mru'
"let g:twiggy_local_branch_sorts = ['mru', 'date']
" Values can be either 'alpha'or 'date'.
let g:twiggy_remote_branch_sort = 'date'

augroup myTwiggySourceLocalMaps
  au!
  au FileType twiggy nnoremap <buffer><silent> % call twiggy#call('gc')
augroup END
