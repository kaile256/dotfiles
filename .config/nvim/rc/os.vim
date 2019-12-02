" From: init.vim

set fileformats=unix,dos,mac

if has('win32') || has('win64')
  " slash:  '\' in file names replaced with '/'
  " unix:   with Unix end-of-line format, <NL>, even on Windows or DOS
  set viewoptions+=slash,unix
  set shellslash
endif

"if execute('!uname -r') =~ ''
"
"endif
