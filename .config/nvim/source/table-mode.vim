" From: memo.toml
" Repo: dhruvasagar/vim-table-mode

" Ref: default of g:var; dhruvasagar/vim-table-mode/plugin/table-mode.vim @17

augroup TableModeCallMyFunc
  au!
  function! s:arrange_table() abort "{{{
    if &ft ==# ('org' || 'vimwiki' || 'markdown')
      if &modifiable && !&readonly
        silent TableModeRealign
      endif
    endif
  endfunction "}}}
  au InsertLeave * call <SID>arrange_table()
  "" Relatively Heavy for CPU
  au InsertEnter *.wiki,*.md,*.org,*.txt
        \ silent TableModeEnable
        \ | au InsertLeave * ++once silent TableModeDisable
augroup END
