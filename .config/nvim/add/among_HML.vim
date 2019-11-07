" From: myplug.toml
" Repo: kaile256/vim-among_HML

let g:among_HML#succession#disable = 0

let g:among_HML#succession#next_if_already_there = 1

let g:among_HML_succession_combinations = {}
let g:among_HML_succession_combinations[0] = {
      \ 'H': [12.5, 0],
      \ 'K': [8.33, 0],
      \ 'M': [25, 0],
      \ 'J': [16.66, 0],
      \ 'L': [37.5, 0],
      \ }

let g:among_HML_succession_combinations[100] = {
      \ 'L': [75, 0],
      \ 'M': [87.5, 0],
      \ }

"nnoremap <silent> H :<c-u>call among_HML#succession#initialize(0)<cr>
"nnoremap <silent> L :<c-u>call among_HML#succession#initialize(100)<cr>

nnoremap <silent> K :<c-u>call among_HML#percent(25)<cr>
nnoremap <silent> J :<c-u>call among_HML#percent(75)<cr>

" TODO: default should operate linewise.
onoremap <silent> K :<c-u>call among_HML#percent(25)<cr>
onoremap <silent> J :<c-u>call among_HML#percent(75)<cr>
xnoremap <silent> K <Cmd>call among_HML#percent(25)<cr>
xnoremap <silent> J <Cmd>call among_HML#percent(75)<cr>

nnoremap gK K
nnoremap <space>J J
xnoremap gK K
xnoremap <space>J J

nnoremap <silent> gH :<c-u>call among_HML#get_half#terminal(0)<cr>
nnoremap <silent> gM :<c-u>call among_HML#get_half#terminal(50)<cr>
nnoremap <silent> gL :<c-u>call among_HML#get_half#terminal(100)<cr>

nnoremap <silent> <c-j> :<c-u>call among_HML#scroll#percent(25, 'down')<cr>
nnoremap <silent> <c-k> :<c-u>call among_HML#scroll#percent(25, 'up')<cr>

