" From: init.vim

augroup AppendFileType
  au!
  au BufWinEnter *.txt         setl syn=help
  au BufWinEnter *.vim!        setl ft=vim
  au BufWinEnter *.vimrc!      setl ft=vim
  au BufWinEnter i3/*/config   setl ft=i3
  au BufWinEnter *.snip        setl ft=neosnippet
  au BufWinEnter *.html        setl ft=html
augroup END

augroup MyRuntimesOnFileTypes
  au!
  au FileType vim      runtime! vim.vim
  au FileType toml     runtime! toml.vim
  au FileType markdown runtime! markdown.vim
  au FileType help     runtime! help.vim
  au FileType i3       runtime! i3.vim
  au FileType ruby     runtime! ruby.vim
  au FileType python   runtime! python.vim
  au FileType qf       runtime! qf.vim
  au FileType json     runtime! json.vim
augroup end

augroup MyLazyRuntimes
  au!
  au WinEnter * if &ro | runtime! readonly.vim
  au BufEnter * if &diff | runtime! diff.vim | endif
  "au WinEnter,BufEnter * if &bt ==# 'quickfix' | runtime quickfix.vim
augroup END

augroup AutoDeleteWhiteSpace
  au!
  au BufWritePre * keeppatterns %s/\s\+$//ge
augroup END
