" From: git.toml
" Repo: sodapopcan/vim-twiggy

" CAUTION: useless if &shell=fish

let g:twiggy_split_method = 'botright'

" Values can be 'aplha', 'mru', 'date' or 'track'
let g:twiggy_close_on_fugitive_command = 1
let g:twiggy_local_branch_sort = 'mru'
"let g:twiggy_local_branch_sorts = ['mru', 'date']
" Values can be either 'alpha'or 'date'.
let g:twiggy_remote_branch_sort = 'date'

command! Gbranch :call panesFM#weed_out() | Twiggy

noremap <silent> g<a-i> :Gbranch<cr>
