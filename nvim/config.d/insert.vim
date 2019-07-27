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

""" Terminal
if has('terminal')
  augroup ModifiableTermMode
    au! TermOpen * setlocal modifiable
  augroup END
endif

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

""" Regiser
set clipboard+=unnamedplus

""" Visual Mode
" visualize even if there is no chars.
set virtualedit=block

""" Commandline Mode
set noshowcmd
" activate completion on command-line
set wildmenu
set wildmode=list:longest
"set history=10000

""" Pop-Up Menu
"is has('nvim') || 
"  set wildoptions=pum
"  set pumblend=20
"endif

"""" KEYMAP
inoremap <a-space>w <esc>:w<cr>

""" Undo Break
"" Put
inoremap <a-p> <c-g>u<esc>p
inoremap <c-r> <c-g>u<c-r>
"" Backspace
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>

augroup UndoBreakOnFileType
  au!
  au FileType html,markdown inoremap <buffer> , ,<c-g>u
  au FileType html,markdown inoremap <buffer> . .<c-g>u
  au FileType html,markdown inoremap <buffer> ! !<c-g>u
  au FileType html,markdown inoremap <buffer> ? ?<c-g>u
augroup END

""" Register
"" Yank
nnoremap <space>y "+y
xnoremap <space>y "+y

"" Paste
nnoremap <space>p "+p
xnoremap <space>p "+p
nnoremap <space>P "+P
xnoremap <space>P "+P
" CAUTION: not for xmap; that makes delay.
nnoremap yp "0P
nnoremap yP "0P

"" Black-Hole
nnoremap <space>x "_x
nnoremap <space>d "_d
nnoremap <space>c "_c
