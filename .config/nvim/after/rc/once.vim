" From: init.vim

augroup myRuntimesOnce
  au InsertEnter,CmdLineEnter,CmdWinEnter * ++once runtime once/autocorrect.vim
  " au CmdLineEnter,CmdWinEnter * ++once runtime once/cabbrs.vim
  au CmdLineEnter,CmdWinEnter * ++once runtime once/commands.vim

  runtime once/omaps.vim
  au InsertEnter              * ++once runtime once/imaps.vim
  au CmdLineEnter,CmdWinEnter * ++once runtime once/cmaps.vim
  exe 'au' TermOpen '* ++once runtime once/tmaps.vim'
augroup END

