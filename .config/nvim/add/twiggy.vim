" From: git.toml
" Repo: sodapopcan/vim-twiggy
" Ref: add/merginal.vim

" CAUTION: useless if &shell=fish

let g:twiggy_split_method = 'botright'
"let g:twiggy_group_locals_by_slash = 0

" Values can be 'aplha', 'mru', 'date' or 'track'
let g:twiggy_close_on_fugitive_command = 1
let g:twiggy_local_branch_sort = 'mru'
"let g:twiggy_local_branch_sorts = ['mru', 'date']
" Values can be either 'alpha'or 'date'.
let g:twiggy_remote_branch_sort = 'date'

command! -complete=custom,TwiggyCompleteBranches -range -addr=lines -nargs=* Gbranch
      \ :Twiggy

" Mnemonic: the char 'y' looks like branch.
noremap <silent> <a-y> :vert 30 Gbranch<cr>
