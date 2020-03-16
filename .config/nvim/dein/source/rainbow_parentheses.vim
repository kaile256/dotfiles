" TOML: appearance.toml
" Repo: kien/rainbow_parentheses.vim

augroup myRainbowParenthesesSource
  " Available: Round Square Braces Chevrons
  au!
  au Syntax *.{c,cpp,objc,objcpp,go,java,rs} :RainbowParenthesesLoadBraces
  au FileType c,cpp,objc,objcpp,go,java,rust call rainbow_parentheses#activate()
augroup END
