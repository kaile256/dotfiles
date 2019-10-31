" From: myplug.toml
" Repo: kaile256/vim-window-picker

noremap <silent> <a-space><space>   :<c-u>WindowReduce<cr>
noremap <silent> <a-space><a-space> :<c-u>WindowReduce<cr>

augroup WindowPKCallMyFunc
  au! OptionSet * if &diff | noremap <buffer><nowait> dq :<c-u>WindowReduce<cr> | endif
augroup END

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
