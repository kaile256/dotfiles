" TOML: appearance.toml
" Repo: Xuyuanp/scrollbar.nvim

augroup ScrollbarAdd-manageScrollbar
  au WinEnter,FocusGained,CursorMoved,VimResized *
        \ silent! lua require('scrollbar').show()
  au WinLeave,FocusLost                          *
        \ silent! lua require('scrollbar').clear()
augroup END
