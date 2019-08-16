"""" From: tool.toml


augroup CapsLock
  au! InsertLeave,WinLeave,CmdwinLeave * <Plug>CapsLockDisable
augroup END

nnoremap <c-q> <Plug>CapsLockDisable
