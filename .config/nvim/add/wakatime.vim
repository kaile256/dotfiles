" From: tool.toml

if exists('g:loaded_openbrowser')
  command! Wakatime     :OpenBrowser https://wakatime.com/dashboard
elseif executable('qutebrowser')
  command! Wakatime     :!qutebrowser https://wakatime.com/dashboard
elseif executable('google-chrome-stable')
  command! Wakatime     :!google-chrome-stable https://wakatime.com/dashboard
elseif executable('firefox')
  command! Wakatime     :!firefox https://wakatime.com/dashboard
endif
