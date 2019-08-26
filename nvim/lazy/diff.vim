augroup MakeSureWrap
  au!
  au BufRead * if &diff | setl wrap | endif
augroup END
