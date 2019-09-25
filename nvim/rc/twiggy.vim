" From: external.toml

let g:twiggy_split_method = 'botright' " useless

" Values can be 'aplha', 'mru', 'date' or 'track'
let g:twiggy_close_on_fugitive_command = 1
let g:twiggy_local_branch_sort = 'mru'
"let g:twiggy_local_branch_sorts = ['mru', 'date']
" Values can be either 'alpha'or 'date'.
let g:twiggy_remote_branch_sort = 'date'

nnoremap <Plug>(twiggy-standard) :Twiggy<cr>
command! Gbranch :Twiggy
nmap <silent> <a-y><a-y> <Plug>(twiggy-standard)
