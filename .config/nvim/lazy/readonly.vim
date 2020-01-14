" From: init.vim

"setl signcolumn=
"setl nomodifiable

if !&modifiable && !&diff && @% !~# '.git'
  nnoremap <buffer><nowait> d <c-d>
  nnoremap <buffer><nowait> u <c-u>
endif

if expand('%:p') =~# '^/etc/sudoers\%[\.d/]'
  setl nomodifiable
  echoerr " You'd better edit by $ visudo"
endif
