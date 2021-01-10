" TOML: git.toml
" Repo: airblade/vim-gitgutter
" Another: add/gitgutter.vim
" Another: source/gitgutter.vim

au! gitgutter CursorHold,CursorHoldI
augroup myGitgutterPos-AdditionalUpdate
  au TextChanged,InsertLeave * GitGutter
augroup END

