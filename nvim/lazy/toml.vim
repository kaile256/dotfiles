" From: init.vim
if exists('b:loaded_lazy_toml')
  finish
endif
let b:loaded_lazy_toml = 1

setl fdm=marker fdl=0

augroup AutoFormatOnToml
  au!
  " Remove Unnecessary part of URL
  au BufWrite *.toml ++once keeppatterns %s/https:\/\/github.com\///ge
augroup END

noremap <buffer><silent> <S-TAB> :keeppatterns %s/^\s\+//ge<cr> 

" Before Typo
inoreabbr <buffer> "{{{ #{{{
inoreabbr <buffer> "}}} #}}}
