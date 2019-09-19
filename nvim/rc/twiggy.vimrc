" From: git.toml

let g:twiggy_close_on_fugitive_command = 1

" local: can be 'aplha', 'mru', 'date' or 'track'
let g:twiggy_local_branch_sort = 'mru'
" remote: can only be either 'aplha' or 'date'
let g:twiggy_remote_branch_sort = 'date'

command! Gbranch :Twiggy
nnoremap <silent> <a-y><a-y> :Twiggy<cr>
