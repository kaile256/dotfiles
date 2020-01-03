" From: memo.toml
" Repo: dhruvasagar/vim-table-mode

" Ref: see default values for g:var in dhruvasagar/vim-table-mode/plugin/table-mode.vim @17
augroup myTableMode
  au!
  au InsertEnter *.{wiki,md,org,txt} silent TableModeEnable
  au InsertLeave *.{wiki,md,org,txt} silent TableModeRealign
  " Note: some functions would not work if disabled on `InsertLeave`
  "au InsertLeave *.{wiki,md,org,txt} silent TableModeDisable
augroup END
