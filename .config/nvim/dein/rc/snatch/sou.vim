" TOML: public.toml
" Repo: kaile256/vim-snatch

augroup snatch-notifications
  autocmd User SnatchAbortedPost echohl ErrorMsg
  autocmd User SnatchAbortedPost echomsg '[snatch] abort'
  autocmd User SnatchAbortedPost echohl None

  autocmd User SnatchCancelledPost echohl ErrorMsg
  autocmd User SnatchCancelledPost echomsg '[snatch] cancel'
  autocmd User SnatchCancelledPost echohl None
augroup END

augroup Snatch/InsertLeaveAfterSnatching
  let g:snatch_status = {}
  autocmd User SnatchInsertPost if g:snatch_status.prev_mode ==# 'i' |
        \   call feedkeys("\<Esc>l")
        \ | endif
augroup END
