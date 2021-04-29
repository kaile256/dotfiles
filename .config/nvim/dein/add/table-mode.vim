" TOML: memo.toml
" Repo: dhruvasagar/vim-table-mode
" Another: add/table-mode.vim

omap iq <Plug>(table-mode-cell-text-object-i)
xmap iq <Plug>(table-mode-cell-text-object-i)
omap aq <Plug>(table-mode-cell-text-object-a)
xmap aq <Plug>(table-mode-cell-text-object-a)

augroup myTableMode/Add
  " au BufRead *.{wiki,md,org,txt} TableModeEnable
  au InsertLeave *.{wiki,md,org,txt} TableModeRealign
  " Note: some functions would not work if disabled on `InsertLeave`
  "au InsertLeave *.{wiki,md,org,txt} silent TableModeDisable
augroup END
