if fnamemodify(@%, ':p') !~# 'vim' | finish | endif

augroup myTomlFtplugin
  if exists('#myTomlFtplugin') | au! myTomlFtplugin
  endif
  " Remove Unnecessary part of URL
  au FocusGained *vim**/*.toml
        \ let @+ = substitute(@+, 'https://github.com/', '', 'g')
augroup END

