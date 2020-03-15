" TOML: appearance.toml
" Repo: frazrepo/vim-rainbow
" Another: source/rainbow.vim

augroup myRainbowAdd
  au!
  " FIXME: Make it work from autocmd
  au FileType c,cpp,objc,objcpp,go,java,rust call rainbow#load()
augroup END
