" From: init.vim

"setl signcolumn=
"setl nomodifiable
"nnoremap <buffer><nowait> d <c-d>
"nnoremap <buffer><nowait> u <c-u>

if getfperm(expand('<amatch>')) =~# '^r-'
  " TODO: find the au-event to work it
  echoerr expand('<amatch>') 'is different from what sudoers see; should be reopen by su'
endif
