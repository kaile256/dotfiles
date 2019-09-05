" From: init.vim

setl fdm=marker fdl=0

augroup AutoFormatOnToml
  au!
  " Remove Unnecessary part of URL
  au BufWritePre *.toml keeppatterns %s/https:\/\/github.com\///ge
augroup END

"noremap <buffer><silent> <S-TAB> :keeppatterns %s/^\s\+//ge<cr>
