augroup myFtDetect
  if exists('#myFtdetect')
    au! myFtDetect
  endif
  au BufRead *.jad setfiletype java
augroup END
