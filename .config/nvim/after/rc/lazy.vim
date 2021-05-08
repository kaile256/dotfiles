" From: init.vim

augroup myRuntimesLazy
  exe 'au' TermOpen '* runtime! lazy/terminal/*.vim'
  au CmdwinEnter * runtime lazy/cmdwin.vim
  " FIXME: source zenkaku.vim from external terminal, too.
  au BufNew * ++once runtime lazy/zenkaku.vim
  au WinNew * runtime lazy/zenkaku.vim

  au BufWinEnter *      if &diff | runtime lazy/diff.vim     | endif
  au OptionSet diff     if &diff | runtime lazy/diff.vim     | endif
  au FileType *         if &ro   | runtime lazy/readonly.vim | endif
  au OptionSet readonly if &ro   | runtime lazy/readonly.vim | endif
augroup END

