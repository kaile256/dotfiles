" TOML: appearance.toml
" Repo: frazrepo/vim-rainbow
" Another: source/rainbow-frazrepo.vim

augroup myRainbowAdd
  au!
  au FileType c,cpp,objc,objcpp,go,java,rust,vim :RainbowLoad
augroup END
