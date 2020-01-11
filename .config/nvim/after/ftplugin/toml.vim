" From: filetype.vim

"setl fdm=marker fdl=0
setl indentkeys=o,O

augroup AutoFormatOnToml
  au!
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
