" From: init.vim

augroup AppendFileType
  au!
  au BufWinEnter *.txt        setl syn=help
  au BufWinEnter *.snip       setl ft=neosnippet
  au BufWinEnter i3/**/config setl ft=i3
  "au BufWinEnter dotfiles/** setl fdm=marker
augroup END

augroup MyRuntimesOnFileTypes
  au!
  au FileType vim      runtime! vim.vim
  au FileType toml     runtime! toml.vim
  au FileType markdown runtime! markdown.vim
  au FileType help     runtime! help.vim
  au FileType i3       runtime! i3.vim
  au FileType qf       runtime! qf.vim
augroup END

augroup MyLazyRuntimes
  au!
  "au BufWinEnter * if &ro | runtime! readonly.vim
  au BufEnter * if &diff | runtime! diff.vim | endif
  "au WinEnter,BufEnter * if &bt ==# 'quickfix' | runtime quickfix.vim
augroup END

"augroup AutoDeleteWhiteSpace
" Use editorconfig.vim
"  au!
"  au BufWritePre * keeppatterns %s/\s\+$//ge
"augroup END
