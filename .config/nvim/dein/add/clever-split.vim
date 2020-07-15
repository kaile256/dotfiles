" TOML: default.toml
" Repo: rhysd/clever-split.vim

augroup myCleverSplitAdd
  au BufWinEnter *vim**/* let &l:keywordprg = ':CleverHelp'
augroup END
