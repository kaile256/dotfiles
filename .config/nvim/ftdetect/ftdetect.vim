augroup myFtDetect
  au BufNewFile,BufRead PKGBUILD[-.]* setlocal ft=PKGBUILD

  au BufNewFile,BufRead */.Xresources.d**/* setlocal ft=xdefaults
  au BufNewFile,BufRead */{xkb,.xkb}/* setlocal ft=xkb

  au BufNewFile,BufRead .vmailrc setlocal ft=yaml

  au BufNewFile,BufRead *.jad setlocal ft=java

  au BufNewFile,BufRead .babelrc setlocal ft=json
augroup END
