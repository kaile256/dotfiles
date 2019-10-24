" From: myplug.toml
" Repo: kaile256/vim-panes-farmer

noremap <silent> <a-space><space>   :<c-u>WinWeedout<cr>
noremap <silent> <a-space><a-space> :<c-u>WinWeedout<cr>

let g:panesFM_weed_list = {
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
