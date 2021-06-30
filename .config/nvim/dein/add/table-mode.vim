" TOML: memo.toml
" Repo: dhruvasagar/vim-table-mode
" Another: add/table-mode.vim

omap iq <Plug>(table-mode-cell-text-object-i)
xmap iq <Plug>(table-mode-cell-text-object-i)
omap aq <Plug>(table-mode-cell-text-object-a)
xmap aq <Plug>(table-mode-cell-text-object-a)

function! s:realign_in_table() abort
  if getline('.') !~# '^\s*|.*|\s*$' | return | endif
  TableModeRealign
endfunction

augroup myTableMode/Add
  au TextChanged,CompleteChanged,InsertLeave
        \ *.{wiki,md,org,txt} call s:realign_in_table()
  " au BufRead *.{wiki,md,org,txt} TableModeEnable
  " Note: some functions would not work if disabled on `InsertLeave`
  "au InsertLeave *.{wiki,md,org,txt} silent TableModeDisable
augroup END
