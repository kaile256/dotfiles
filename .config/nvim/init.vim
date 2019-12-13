set encoding=utf-8
scriptencoding utf-8
set termencoding=utf-8
set fileencodings=ucs-bom,utf-8,euc-jp,sjis,default,latin1

runtime rc/variables.vim  " CAUTION: don't comment out; many files depends on it.
runtime rc/os.vim
runtime rc/dein.vim  " contains `filetype plugin indent on`
runtime rc/backupfiles.vim
runtime rc/options.vim
runtime rc/filetype.vim
runtime rc/findpath.vim
runtime rc/loaded.vim " disturbs to :source vimscripts under $VIMRUNTIME
" Note: `!` is required to source all the same named files.
runtime! keymap/*.vim
runtime rc/startpage.vim

augroup RuntimesSelection
  au!
  au WinNew      * ++once runtime once/zenkaku.vim
  au VimEnter    * ++once runtime once/omaps.vim
  au InsertEnter * ++once runtime once/imaps.vim
  au CmdLineEnter,CmdWinEnter * ++once runtime once/cmaps.vim
  au CmdLineEnter,CmdWinEnter * ++once runtime once/cabbrs.vim
  au CmdLineEnter,CmdWinEnter * ++once runtime once/commands.vim
  au CmdwinEnter  * runtime lazy/cmdwin.vim
  " Note: VimEnter,BufNew for not to startinsert on VimEnter
  "au VimEnter,BufNew * if &bt ==# 'terminal' | runtime lazy/terminal.vim | endif
  au TermOpen * runtime lazy/terminal.vim
  au TermOpen * ++once runtime once/tmaps.vim

  au OptionSet   diff if &diff | runtime lazy/diff.vim     | endif
  au BufWinEnter *    if &ro   | runtime lazy/readonly.vim | endif
  au BufWritePre * if getfperm('<amatch>') =~# '^rwx' | setl ff=unix | endif
augroup END
