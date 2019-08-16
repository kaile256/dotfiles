"""" From: tool.toml


augroup CapsLock
  au! InsertLeave,WinLeave,CmdwinLeave * norm <Plug>CapsLockDisable
augroup END

nnoremap <c-q> <Plug>CapsLockDisable
