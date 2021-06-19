" TOML: git.toml
" Repo: airblade/vim-gitgutter

if has('nvim') && dein#tap('gitsigns.nvim')
  GitGutterDisable
endif

au! gitgutter CursorHold,CursorHoldI
augroup myGitgutterPos-AdditionalUpdate
  au BufWinEnter,TextChanged,InsertLeave * GitGutter
augroup END

hi! link GitGutterAdd    DiffAdd
hi! link GitGutterChange DiffChange
hi! link GitGutterDelete DiffDelete
