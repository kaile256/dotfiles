" TOML: browse.toml
" Repo: dyng/ctrlsf.vim
" Another: add/ctrlsf.vim

augroup myCtrlsfPost
  au!
  " Note: setpos() for bufnr seems to be ignored
  " au FileType ctrlsf :call setpos('.', [bufnr('__CtrlSF__'), 1, 1, 0])
augroup END

