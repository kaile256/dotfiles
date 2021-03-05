setlocal textwidth=120

if expand('%:p') =~# 'vim\|/dein/'
  setlocal keywordprg=:help
endif

