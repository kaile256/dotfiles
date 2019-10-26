" From: myplug.toml
" Repo: kaile256/vim-panes-publisher

noremap <silent> <a-space><space>   :<c-u>WinRevise<cr>
noremap <silent> <a-space><a-space> :<c-u>WinRevise<cr>

let g:panesPB_weed_list = {
      \ 'buftype': [
      \   'nofile',
      \   'nowrite',
      \   'quickfix',
      \   ],
      \ 'path': [
      \   'twiggy:\/\/',
      \   '.git\/',
      \   ],
      \ }
