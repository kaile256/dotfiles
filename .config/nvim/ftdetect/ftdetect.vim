augroup myFtDetect
  if exists('#myFtdetect') | au! myFtDetect
  endif
  au BufNewFile,BufRead {.Xresources.d,X11}**/* setlocal ft=xdefaults

  au BufNewFile,BufRead .vmailrc setlocal ft=yaml

  au BufNewFile,BufRead *.jad setlocal ft=java
augroup END
