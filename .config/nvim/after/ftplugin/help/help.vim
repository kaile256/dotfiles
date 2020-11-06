" From: filetype.vim

let s:is_editing = &modifiable || !&readonly || @% =~# 'fugitive:\/\/\/'
if s:is_editing
  setlocal concealcursor=n
  setlocal conceallevel=2
else
  setlocal signcolumn= nolist foldlevel=0
  setlocal bufhidden=wipe
endif

