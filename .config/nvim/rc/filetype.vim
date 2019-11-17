" From: init.vim

augroup AppendFileType
  au!
  au BufNewFile,BufRead *.txt    setl syn=help
  au BufNewFile,BufRead *.snip   setl ft=neosnippet
  au BufNewFile,BufRead *.dict   setl ft=skkdict
  au BufNewFile,BufRead .vmailrc setl ft=yaml
  au BufNewFile,BufRead i3/**/config,i3/**.conf setl ft=i3
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
