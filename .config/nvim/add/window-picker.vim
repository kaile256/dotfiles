" From: myplug.toml
" Repo: kaile256/vim-window-picker

noremap <silent> <a-space><space>   :<c-u>WindowPKreduce<cr>
noremap <silent> <a-space><a-space> :<c-u>WindowPKreduce<cr>

let g:windowPK_kill_list = {
      \ '&buftype': [
      \   'nofile',
      \   'nowrite',
      \   'quickfix',
      \   ],
      \ 'path': [
      \   'twiggy:\/\/',
      \   '.git\/',
      \   ],
      \ }
