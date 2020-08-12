" TOML: appearance.toml
" Repo: luochen1990/rainbow
" Another: source/rainbow-luochen1990.vim

augroup myRainbowLuochen1990Source
  " disable autocmds in the plugin which belongs to no augroup.
  let g:rainbow_active = 1
  au Syntax,ColorScheme * ++nested call rainbow_main#load()
augroup END
