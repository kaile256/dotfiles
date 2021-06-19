" TOML: public.toml
" Repo: kaile256/vim-snatch

let g:snatch#no_default_mappings = 1
let g:snatch#timeoutlen = -1

augroup snatch-notifications
  autocmd User SnatchAbortedPost echohl ErrorMsg
  autocmd User SnatchAbortedPost echomsg '[snatch] abort'
  autocmd User SnatchAbortedPost echohl None

  autocmd User SnatchCancelledPost echohl ErrorMsg
  autocmd User SnatchCancelledPost echomsg '[snatch] cancel'
  autocmd User SnatchCancelledPost echohl None
augroup END

augroup Snatch/InsertLeaveAfterSnatching
  if !exists('g:snatch_status')
    " Note: The if-block is to reload for new scripts.
    let g:snatch_status = {}
  endif
  autocmd User SnatchInsertPost if g:snatch_status.prev_mode ==# 'i'
        \ && v:operator !=# 'c' |
        \   call feedkeys("\<Esc>l")
        \ | endif
augroup END
