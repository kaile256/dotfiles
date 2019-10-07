" From: ftplugin.toml
" Repo: thinca/vim-ft-help_fold

augroup HelpFoldModelineOff
  au! FileType text * if &bt ==# 'help' | setl nomodeline nomodelineexpr fdm=0 | endif
augroup END
