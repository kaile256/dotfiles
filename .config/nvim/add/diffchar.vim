" From: extension.toml
" Repo: rickhowe/diffchar.vim

augroup DiffChar
  au!
  au OptionSet if &diff && exists(':DiffCharShow') | DiffCharShow | endif
  au OptionSet if &diff && exists(':SDChar')       | SDChar       | endif

  au DiffUpdated if exists(':DiffCharReset') | DiffCharReset | endif
  au DiffUpdated if exists(':RDChar')        | RDChar        | endif
augroup END
