if exists('#myFtdetect') | au! myFtDetect
endif
augroup myFtDetect
  au BufNewFile,BufRead {.Xresources.d,X11}**/* setlocal ft=xdefaults

  au BufNewFile,BufRead .vmailrc setlocal ft=yaml

  au BufNewFile,BufRead *.jad setlocal ft=java
augroup END
