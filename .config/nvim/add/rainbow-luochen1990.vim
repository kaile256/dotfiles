" TOML: appearance.toml
" Repo: luochen1990/rainbow
" Another: source/rainbow-luochen1990.vim

augroup myRainbowLuochen1990Source
  au!
  " use g:rainbow_active instead
  au Syntax,ColorScheme * call rainbow_main#load()
augroup END
