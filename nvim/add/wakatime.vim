" From: tool.toml

if exists('g:loaded_openbrowser')
  command! Activity     :OpenBrowser https://wakatime.com/dashboard
  command! ShowActivity :OpenBrowser https://wakatime.com/dashboard
elseif executable('qutebrowser')
  command! Activity     :!qutebrowser https://wakatime.com/dashboard
  command! ShowActivity :!qutebrowser https://wakatime.com/dashboard
elseif executable('google-chrome-stable')
  command! Activity     :!google-chrome-stable https://wakatime.com/dashboard
  command! ShowActivity :!google-chrome-stable https://wakatime.com/dashboard
elseif executable('firefox')
  command! Activity     :!firefox https://wakatime.com/dashboard
  command! ShowActivity :!firefox https://wakatime.com/dashboard
endif
