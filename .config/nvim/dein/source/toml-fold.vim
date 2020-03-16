" From: myplug.toml
" Repo: kaile256/vim-toml-fold

let g:tomlfold#styles_on_filetype = {
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
