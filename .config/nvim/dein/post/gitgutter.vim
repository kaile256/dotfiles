" TOML: git.toml
" Repo: airblade/vim-gitgutter
" Another: add/gitgutter.vim
" Another: source/gitgutter.vim

au! gitgutter CursorHold,CursorHoldI

au gitgutter BufWritePost * :GitGutter
