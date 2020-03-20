" From: filetype.vim

"setl fdm=marker fdl=0
setl indentkeys=o,O

augroup myTomlFtplugin
  if exists('#myTomlFtplugin')
    au! myTomlFtplugin
  endif
  " Remove Unnecessary part of URL
  au BufWritePre *vim**/*.toml keeppatterns %s;https://github.com/;;ge
augroup END

" especially for dein in private
inoreabbr <buffer><expr> #[
      \ (getline('.') =~# ']')
      \ ? '#[ ]<Left>'
      \ : '#['
"inoreabbr <buffer><expr> #[
"      \ (getline('.') =~# ']')
"      \ ? '#[]'
"      \ : '#['
