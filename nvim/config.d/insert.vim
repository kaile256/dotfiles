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
set clipboard+=unnamedplus,unnamed

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
set pumheight=50
"is has('nvim') || 
"  set wildoptions=pum
"  set pumblend=20
"endif

"""" KEYMAP
""" Visual Mode
"" Sort; Initial to Reverse Sort
xnoremap <c-s><c-a> :sort   <cr>
xnoremap <c-s>a     :sort   <cr>
xnoremap <c-s>A     :sort!  <cr>
" Ignore Case
xnoremap <c-s><c-i> :sort  i<cr>
xnoremap <c-s>i     :sort  i<cr>
xnoremap <c-s>I     :sort! I<cr>
xnoremap <c-s><c-n> :sort  n<cr>
xnoremap <c-s>n     :sort  n<cr>
xnoremap <c-s>N     :sort! n<cr>
" Float Number
xnoremap <c-s><c-f> :sort  f<cr>
xnoremap <c-s>f     :sort  f<cr>
xnoremap <c-s>F     :sort! f<cr>
xnoremap <c-s><c-x> :sort  x<cr>
xnoremap <c-s>x     :sort  x<cr>
xnoremap <c-s>X     :sort! x<cr>
xnoremap <c-s><c-o> :sort  o<cr>
xnoremap <c-s>o     :sort  o<cr>
xnoremap <c-s>O     :sort! o<cr>

""" Advanced <c-g>
inoremap <c-g><c-h> <Left>
inoremap <c-g>h     <Left>
inoremap <c-g><c-l> <Right>
inoremap <c-g>l     <Right>
inoremap <c-g><c-b> <S-Left>
inoremap <c-g>b     <S-Left>
inoremap <c-g><c-w> <S-Right>
inoremap <c-g>w     <S-Right>

""" MenuPopup
"" Alt-ESC; or type <c-o> to insert-normal.
inoremap <a-space>w <esc>:w<cr>
" make sure <a-hjkl> work as <esc>hjkl, e.g., while pop-up menu shows.
inoremap <a-h> <esc>h
inoremap <a-j> <esc>j
inoremap <a-k> <esc>k
inoremap <a-l> <esc>l
" <a-web> as well
inoremap <a-w> <esc>w
inoremap <a-b> <esc>b
inoremap <a-e> <esc>e
" <a-ydcup> as well; to redo, type <c-o><c-r>.
inoremap <a-y> <esc>y
inoremap <a-x> <esc>x
inoremap <a-d> <esc>d
inoremap <a-c> <esc>c
inoremap <a-u> <esc>u
inoremap <a-p> <c-g>u<esc>p
" <a-iao> as well; forget Initial O.
inoremap <a-i> <esc>i
inoremap <a-a> <esc>a
inoremap <a-o> <esc>o

""" Undo Break
"" Put
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
