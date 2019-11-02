" From: tool.toml

if exists('g:loaded_openbrowser')
  command! WakaTime     :OpenBrowser https://wakatime.com/dashboard
elseif executable('qutebrowser')
  command! WakaTime     :!qutebrowser https://wakatime.com/dashboard
elseif executable('google-chrome-stable')
  command! WakaTime     :!google-chrome-stable https://wakatime.com/dashboard
elseif executable('firefox')
  command! WakaTime     :!firefox https://wakatime.com/dashboard
endif
