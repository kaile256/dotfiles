augroup CleverNewline
  au!
  au OptionSet * if &fo =~# 'r\|o' | silent! set fo-=r fo-=o | endif
augroup END
