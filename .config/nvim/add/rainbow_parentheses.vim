" TOML: appearance.toml
" Repo: kien/rainbow_parentheses.vim

augroup myRainbowParenthesesAdd
  au!
  au FileType c,cpp,objc,objcpp,go,java,rust call rainbow_parentheses#toggleall()
  " au FileType java call rainbow_parentheses#activate()
augroup END
