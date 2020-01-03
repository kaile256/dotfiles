" From: filetype.vim

"setl fdm=marker fdl=0
setl indentkeys=o,O

augroup AutoFormatOnToml
  au!
  " Remove Unnecessary part of URL
  au BufWritePre *vim**/*.toml keeppatterns %s;https://github.com/;;ge
augroup END
