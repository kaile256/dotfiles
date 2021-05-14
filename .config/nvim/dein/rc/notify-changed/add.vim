" TOML: ext.toml
" Repo: tyru/notify-changed.vim

augroup NotifyChanged-autosetNotified
  au TabLeave,FocusLost,InsertLeave   term://* NotifyChanged
  au TabEnter,FocusGained,InsertEnter term://* NotifyChanged -unwatch
augroup END

