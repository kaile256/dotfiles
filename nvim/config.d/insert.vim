"""" From: init.vim

"""" CONFIG
""" IME
" 0: IME will be off, when lmap is off.
" lmap supports 3 modes: Insert, Commandline and Lang-Arg.
augroup AutoOffIME
  au!
  au InsertLeave * set iminsert=0
  au InsertLeave * set imsearch=0
augroup END

""" Tab-Char
" insert spaces, instead of a tab-char.
set expandtab
" number of spaces, inserted by tab-key, that a tab-char counts for.
set tabstop=2
" number of spaces, inserted by tab-key, next to tab-chars.
set softtabstop=2

""" Indent
" copy indent dependent on first char of current line.
set autoindent
" copy indent dependent on last char of current line.
set smartindent
" indent setting for c-lang.
set cindent

" number of spaces inserted by autoindent.
set shiftwidth=2
" for manual indent, insert spaces according to shiftwidth.
set smarttab
" for '<' & '>' indent, insert spaces according to shiftwidth.
set shiftround


"""" KEYMAP
inoremap <a-space>w <esc>:w<cr>

"" Undo
inoremap <c-r> <c-g>u<c-r>
" type <c-r>" to put foeward "-register in Insert Mode.
inoremap <a-p> <c-g>u<esc>P
