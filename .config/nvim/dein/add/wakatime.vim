" TOML: web.toml
" Repo: wakatime/vim-wakatime
" Ref: ~/.wakatime.cfg
" Ref: ~/.wakatime.log

if exists('g:loaded_openbrowser')
  command! -bar WakaTime :OpenBrowser https://wakatime.com/dashboard &
elseif has('unix')
  command! -bar WakaTime :!xdg-open   https://wakatime.com/dashboard &
endif
