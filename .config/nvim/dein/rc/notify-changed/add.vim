" TOML: ext.toml
" Repo: tyru/notify-changed.vim

augroup NotifyChanged-autosetNotified
  au TabLeave,FocusLost   term://* NotifyChanged
  au TabEnter,FocusGained term://* NotifyChanged -unwatch
augroup END

