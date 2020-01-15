" From: ftplugin.toml
" Repo: matze/vim-ini-fold
" Fork: kaile256/vim-ini-fold

let g:ini_fold_enabled_filetypes = {
      \ 'cfg':       3,
      \ 'config':    3,
      \ 'desktop':   3,
      \ 'dosini':    3,
      \ 'gitconfig': 3,
      \ 'toml':      1,
      \ }

"augroup myIniFoldAdjustment
"  au! BufEnter *vim**/*.toml let b:ini_fold_enable = 3
"augroup END
