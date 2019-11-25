" From: memo.toml
" Repo: dhruvasagar/vim-table-mode

" Ref: see default values for g:var in dhruvasagar/vim-table-mode/plugin/table-mode.vim @17
augroup TableModeCallMyFunc
  au!
  function! s:arrange_table() abort "{{{
    let s:ft = {list -> index(list, &ft) >= 0}
    if s:ft(['org', 'vimwiki', 'markdown'])
      if &modifiable && !&readonly
        silent TableModeRealign
      endif
    endif
  endfunction "}}}
  au InsertLeave * call s:arrange_table()
  au InsertEnter *.wiki,*.md,*.org,*.txt
        \ silent TableModeEnable
        \ | au InsertLeave * ++once silent TableModeDisable
augroup END
