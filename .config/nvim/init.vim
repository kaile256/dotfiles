set encoding=utf-8
scriptencoding utf-8

" sjis: Shift-JIS
set fileencodings=ucs-bom,utf-8,euc-jp,sjis,cp932,default,latin1

" or strftime() returns in Japanese like 1月 23
language time en_US.UTF-8

let mapleader = '<Nop>'
noremap <space> <Nop>

runtime rc/variables.vim  " CAUTION: don't comment out; many files depends on it.
runtime rc/os.vim
runtime dein/dein.vim  " contains `filetype plugin indent on`
runtime rc/backupfiles.vim
runtime rc/options.vim
runtime rc/augroups.vim
runtime rc/findpath.vim
runtime rc/loaded.vim " disturbs to :source vimscripts under $VIMRUNTIME
" Note: `!` is required to source all the same named files.
runtime! keymap/*.vim
runtime rc/startpage.vim

augroup myRuntimesSelection
  if exists('#myRuntimesSelection') | au! myRuntimesSelection
  endif

  au VimEnter    * ++once runtime once/omaps.vim
  au InsertEnter * ++once runtime once/imaps.vim
  au InsertEnter,CmdLineEnter,CmdWinEnter * ++once runtime once/autocorrect.vim
  au CmdLineEnter,CmdWinEnter * ++once runtime once/cmaps.vim
  " au CmdLineEnter,CmdWinEnter * ++once runtime once/cabbrs.vim
  au CmdLineEnter,CmdWinEnter * ++once runtime once/commands.vim
  au CmdwinEnter * runtime lazy/cmdwin.vim
  au Syntax      * runtime lazy/zenkaku.vim
  " Note: VimEnter,BufNew for not to startinsert on VimEnter
  "au VimEnter,BufNew * if &bt ==# 'terminal' | runtime lazy/terminal.vim | endif
  exe 'au' TermOpen '* runtime lazy/terminal.vim'
  exe 'au' TermOpen '* ++once runtime once/tmaps.vim'

  au OptionSet diff     if &diff | runtime lazy/diff.vim     | endif
  au OptionSet readonly if &ro   | runtime lazy/readonly.vim | endif
  "au BufWritePre * if getfperm('<amatch>') =~# '^rwx' | setl ff=unix | endif
augroup END
