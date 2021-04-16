" TOML: public.toml
" Repo: kaile256/vim-snatch

augroup snatch-notifications
  autocmd User SnatchAbortedPost echohl ErrorMsg
  autocmd User SnatchAbortedPost echomsg '[snatch] abort'
  autocmd User SnatchAbortedPost echohl Normal

  autocmd User SnatchCancelledPost echohl ErrorMsg
  autocmd User SnatchCancelledPost echomsg '[snatch] cancel'
  autocmd User SnatchCancelledPost echohl Normal
augroup END
