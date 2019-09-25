" From: external.toml

augroup InfoMyAutoConf
  " this one is which you're most likely to use?
  au FileType * if &bt ==# 'terminal' && &ft ==# '' | nmap <buffer> K <Plug>(InfoFollow)
augroup END
