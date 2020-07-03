" From: init.vim

" set noautoindent " o/O/i_<CR> copies current indent
set copyindent " ignores &expandtab but use current indent char(tab/spaces)
" indent depends on the last char of the prev line
set smartindent " Indent as 'C-indenting'; ignored if &cindent(\|expr) is set

set expandtab " Insert spaces, instead of a tab-char

" Affects <TAB> and <BS>
set tabstop=2 " <TAB> inserts the number of spaces
set shiftwidth=0 " >>/<< inserts the number of spaces; use &tabstop if 0
set softtabstop=-1 " <TAB> is replaced by spaces while less than the value; use &shiftwidth if negative

set smarttab " <BS> deletes spaces as &shiftwidth
set shiftround " for '</>' indent, insert spaces as &shiftwidth

