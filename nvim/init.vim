set encoding=utf-8
scriptencoding utf-8
set fileencodings=ucs-bom,utf-8,euc-jp,sjis,default,latin1
set ambiwidth=double
hi CursorIM guibg=#fabd1f
" default: tcqj
set formatoptions=jmB1cql
set mouse=a

" WARNING: `!` is required to source all the same named files.
runtime options.vim
runtime filetype.vim
runtime window.vim
runtime buffer.vim
runtime! keymap/*.vim
runtime rc/dein.vimrc

augroup RuntimeSelection
  au!
  au VimEnter     * ++once runtime once/loaded.vim
  au CmdLineEnter * ++once runtime once/cmdline.vim
  au BufNew       * ++once runtime once/terminal.vim
  au BufNew       * ++once runtime once/zenkaku.vim
  "au FilterReadPost * runtime lazy/diff.vim
  au BufRead * if &diff | runtime lazy/diff.vim | endif
  " Disturb Auto Comment Out on CR/NL.
  au CursorMovedI * if &l:fo =~# 'ro' | set formatoptions-=ro | endif
augroup END
