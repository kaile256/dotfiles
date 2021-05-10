" TOML: git.toml
" Repo: airblade/vim-gitgutter

au! gitgutter CursorHold,CursorHoldI
augroup myGitgutterPos-AdditionalUpdate
  au BufWinEnter,TextChanged,InsertLeave * GitGutter
augroup END

hi! link GitGutterAdd    DiffAdd
hi! link GitGutterChange DiffChange
hi! link GitGutterDelete DiffDelete
