set encoding=utf-8
scriptencoding utf-8
set termencoding=utf-8
set fileencodings=ucs-bom,utf-8,euc-jp,sjis,default,latin1
set ambiwidth=double
" default: tcqj
set formatoptions=jmB1cql
"set mouse=a

runtime rc/os.vim
runtime rc/variables.vim  " don't comment out; many files depends on it.
runtime rc/backupfiles.vim
runtime rc/dein.vim  " contains `filetype plugin indent on`
runtime rc/options.vim
runtime rc/filetype.vim
runtime rc/loaded.vim " disturbs to :source vimscripts under $VIMRUNTIME
" Note: `!` is required to source all the same named files.
runtime! keymap/*.vim
runtime rc/startpage.vim

augroup RuntimesSelection
  au!
  au WinNew       * ++once runtime once/zenkaku.vim
  au VimEnter     * ++once runtime once/omaps.vim
  au InsertEnter  * ++once runtime once/imaps.vim
  au CmdLineEnter,CmdWinEnter * ++once runtime once/cmaps.vim
  au CmdLineEnter,CmdWinEnter * ++once runtime once/cabbrs.vim
  au CmdLineEnter,CmdWinEnter * ++once runtime once/commands.vim
  au CmdwinEnter  * runtime lazy/cmdwin.vim
  au VimEnter,BufNew * if &bt ==# 'terminal' | runtime lazy/terminal.vim | endif
  au OptionSet * if &diff | runtime lazy/diff.vim | endif
augroup END
