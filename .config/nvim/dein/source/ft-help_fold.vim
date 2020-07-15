" From: ftplugin.toml
" Repo: thinca/vim-ft-help_fold

if exists('#myHelpFoldSource') | au! myHelpFoldSource
endif
augroup myHelpFoldSource
  au OptionSet text,help * call s:helpfold()
augroup END

function! s:helpfold() abort "{{{1
  if &bt ==# 'help' | return | endif
  if &fdm ==# 'expr' && &fde =~# 'HelpFold' | return | endif

  setl fdm=expr fde=HelpFold(v:lnum)
endfunction
