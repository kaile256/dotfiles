" From: filetype.vim

if b:help_readonly
  setlocal signcolumn= nolist foldlevel=0
  " 'wipe' makes it impossible to go back with <C-o> or `:pop`.
  setlocal bufhidden=hide
else
  setlocal concealcursor=n
  setlocal conceallevel=2
endif

