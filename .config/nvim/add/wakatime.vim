" From: web.toml

if exists('g:loaded_openbrowser')
  command! -bar WakaTime :OpenBrowser https://wakatime.com/dashboard &
elseif has('unix')
  command! -bar WakaTime :!xdg-open   https://wakatime.com/dashboard &
endif
