" From: filetype.vim

setl fdm=marker fdl=0
"setl indentkeys=o,O

augroup AutoFormatOnToml
  au!
  " Remove Unnecessary part of URL
  au BufWritePre *.toml keeppatterns %s/https:\/\/github.com\///ge
augroup END

" Note: simple =-operator devasticates indent if &fdm=marker in many filetypes but vim.
noremap <buffer><silent> g= :keeppatterns %s/^\s\+//ge<cr>
