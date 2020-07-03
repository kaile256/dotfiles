" TOML: default.toml
" Repo: rhysd/clever-split.vim

augroup myCleverSplitAdd
  if exists('myCleverSplitAdd') | au! myCleverSplitAdd
  endif
  au BufWinEnter *vim**/* let &l:keywordprg = ':CleverHelp'
augroup END
