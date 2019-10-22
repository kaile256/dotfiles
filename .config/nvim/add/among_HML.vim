" From: myplug.toml
" Repo: kaile256/vim-among_HML

nnoremap <silent> K :<c-u>call among_HML#percent(25)<cr>
nnoremap <silent> J :<c-u>call among_HML#percent(75)<cr>
" TODO: default should operate linewise.
onoremap <silent> K :call among_HML#percent(25)<cr>
onoremap <silent> J :call among_HML#percent(75)<cr>
xnoremap <silent> K <Cmd>call among_HML#percent(25)<cr>
xnoremap <silent> J <Cmd>call among_HML#percent(75)<cr>

nnoremap gK K
nnoremap <space>J J
xnoremap gK K
xnoremap <space>J J

" TODO: make them behave <c-f>-like.
noremap <silent> <c-k> :keepjump norm Kzz<cr>
noremap <silent> <c-j> :keepjump norm Jzz<cr>
