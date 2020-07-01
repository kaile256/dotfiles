" From: init.vim

"set noemoji
" wrap long text: s for space
set wrap
"set whichwrap=h,l
set whichwrap=
augroup myNoWrapWithinAWord
  if exists('#myNoWrapWithinAWord')
    au! myNoWrapWithinAWord
  endif
  au FileType * if !&modifiable | setl linebreak showbreak= | endif
augroup END
" copyindent: Indent with the char that a file's indented by whether tabs or
" spaces. It ignores 'expandtab' to work.
set copyindent
" `breakindent` keeps visually indented according to the actual line.
set breakindent
set showbreak=>\
" Note: `breakat` ONLY works for ASCII characters.
" set breakat+=
