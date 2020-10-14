" From: filetype.vim

if &modifiable || !&readonly || @% =~# 'fugitive:\/\/\/'
  setlocal concealcursor=n
  setlocal conceallevel=2
else
  setlocal signcolumn= nolist foldlevel=0
endif

