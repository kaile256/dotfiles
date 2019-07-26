augroup NewFileType
  au!
  au BufNewFile,BufRead *.vim! set filetype=vim
  au BufNewFile,BufRead *.vimrc! set filetype=vim

  """ i3
  au BufNewFile,BufRead i3/** set filetype=i3
augroup END
