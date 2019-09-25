" tool.toml
" filetype.toml

function! s:arrange_table()
  if &ft ==# 'org' || 'vimwiki'
    silent TableModeRealign
  endif
endfunction

augroup OrgTableMode
  au!
  if &modifiable
    au InsertLeave * call <SID>arrange_table()
    "au InsertLeave *.org,*.txt,*.md,*.wiki, silent TableModeRealign
    "" Relatively Heavy for CPU
    "au WinEnter *.org,*.txt silent TableModeEnable
    "au WinLeave *.org,*.txt silent TableModeDisable
  endif
augroup END
