"""" From: init.vim

"""" CONFIG
""" IME
" 0: IME will be off, when lmap is off.
" lmap supports 3 modes: Insert, Commandline and Lang-Arg.
augroup AutoOffIME
  au!
  au InsertLeave  * set iminsert=0
  au CmdlineLeave * set imsearch=0
augroup END

""" MenuPopup
"augroup KeepAltEscOnPMenu
"  au! MenuPopup * 
"  if input() != ['<c-p>','<c-n>','<c-j>','<c-m>']
"    exe "normal <esc>" 
"  endif
"augroup END
"
""" Tab-Char
" insert spaces, instead of a tab-char.
set expandtab
" number of spaces, inserted by tab-key, that a tab-char counts for.
set tabstop=2
" number of spaces, inserted by tab-key, next to tab-chars.
set softtabstop=2

augroup ReplaceTabWithSpace
  " :retab!; if replace spaces, too.
  au! BufReadPost,BufEnter *
  if ! &readonly || &modifiable | retab | endif
augroup END

""" Indent
" copy indent dependent on first char of current line.
set autoindent
" copy indent dependent on last char of current line.
set smartindent
" indent setting for c-lang.
"set cindent

" number of spaces inserted by autoindent.
set shiftwidth=2
" for manual indent, insert spaces according to shiftwidth.
set smarttab
" for '<' & '>' indent, insert spaces according to shiftwidth.
set shiftround

augroup ResizeIndent
  au!
  au FileType Javascript setlocal shiftwidth=4 tabstop=4 softtabstop=4
  au FileType Ruby       setlocal shiftwidth=2 tabstop=2 softtabstop=2
  au FileType Python     setlocal shiftwidth=2 tabstop=2 softtabstop=2
augroup END

"""" KEYMAP
inoremap <a-space>w <esc>:w<cr>

"" Undo Break
inoremap <c-r> <c-g>u<c-r>
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>

augroup UndoBreakOnFileType
  au!
  au FileType html,markdown inoremap <buffer> , ,<c-g>u
  au FileType html,markdown inoremap <buffer> . .<c-g>u
  au FileType html,markdown inoremap <buffer> ! !<c-g>u
  au FileType html,markdown inoremap <buffer> ? ?<c-g>u
augroup END
