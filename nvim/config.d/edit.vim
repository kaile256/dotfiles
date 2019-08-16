"""" from: init.vim

"""" CONFIG
""" IME
" 0: ime will be off, when lmap is off.
" lmap supports 3 modes: insert, commandline and lang-arg.
augroup AutoOffIME
  au!
  au InsertLeave  * set iminsert=0
  au CmdlineLeave * set imsearch=0
augroup END

""" Terminal
if has('nvim')
  "augroup ModifiableTermMode
  "  au! TermOpen * setlocal modifiable
  "augroup END
endif

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
"set cindent

" number of spaces inserted by autoindent.
set shiftwidth=2
" for manual indent, insert spaces according to shiftwidth.
set smarttab
" for '</>' indent, insert spaces according to shiftwidth.
set shiftround

""" Regiser
" Copy to clipboard without +/* indicated.
"set clipboard+=unnamedplus,unnamed

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
""" Write&Quit
" w! write even read-only file.
nnoremap          <space>w :<c-u>w<cr>
nnoremap <silent> <space>q :<c-u>q<cr>
nnoremap          <space>x :<c-u>w!<cr>
nnoremap <silent> <space>z :<c-u>q!<cr>
"" Special
nnoremap <space>* :<c-u>qa<cr>
nnoremap <space>! :w !sudo tee % > /dev/null<cr> <bar> edit!
"" Buffer
nnoremap <silent> qq :<c-u>bdelete %<cr>
nnoremap <silent> q1 :<c-u>bdelete %<cr>

""" Command-Line
"" Emacs-like
cnoremap <c-a> <home>
cnoremap <a-f> <S-right>
cnoremap <c-f> <right>
cnoremap <c-b> <left>
cnoremap <a-b> <S-left>
cnoremap <c-d> <Del>
"" Cancel
cnoremap <a-h> <c-c><c-w>h
cnoremap <a-j> <c-c><c-w>j
cnoremap <a-k> <c-c>
cnoremap <a-l> <c-c><c-w>l
" <c-k> enter digraph
cnoremap <c-k><a-k> <c-c>

""" Advanced <c-o>
" <c-o>u doesn't work by default
inoremap <c-o>u     <esc>ui
inoremap <c-o><c-r> <esc><c-r>i
""" Advanced <c-g>
inoremap <c-g><c-h> <Left>
inoremap <c-g>h     <Left>
inoremap <c-g><c-l> <Right>
inoremap <c-g>l     <Right>
inoremap <c-g><c-b> <S-Left>
inoremap <c-g>b     <S-Left>
inoremap <c-g><c-w> <S-Right>
inoremap <c-g>w     <S-Right>

""" Instant Escape
""" CAUTION: Never careless mapping on <i_a-hjkl>
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
inoremap <a-s-w> <esc>W
inoremap <a-s-b> <esc>B
inoremap <a-s-e> <esc>E
" <a-ydcup> as well; to redo, type <c-o><c-r>.
inoremap <a-y> <esc>y
inoremap <a-x> <esc>x
inoremap <a-d> <esc>d
inoremap <a-c> <esc>c
inoremap <a-u> <esc>u
inoremap <a-p> <c-g>u<esc>p
inoremap <a-s-y> <esc>Y
inoremap <a-s-x> <esc>X
inoremap <a-s-d> <esc>D
inoremap <a-s-c> <esc>C
inoremap <a-s-u> <esc>U
inoremap <a-s-p> <c-g>u<esc>P
" <a-iao> as well
" <a-ai> could be just <left>/<right>, but I prefer <esc> before.
inoremap <a-a> <esc>la
inoremap <a-i> <esc>i
inoremap <a-o> <esc>o
inoremap <a-s-o> <esc>O
inoremap <a-s-i> <esc>I
inoremap <a-s-a> <esc>A

""" Del
"" NOTICE: <c-d> increases indent on Insert Mode.

""" Undo Break
inoremap <c-j> <c-g>u<c-j>
"" Put
inoremap <c-r> <c-g>u<c-r>
"" Backspace
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>

augroup UndoBreakOnFileType
  au!
  au filetype html,markdown inoremap <buffer> , ,<c-g>u
  au filetype html,markdown inoremap <buffer> . .<c-g>u
  au filetype html,markdown inoremap <buffer> ! !<c-g>u
  au filetype html,markdown inoremap <buffer> ? ?<c-g>u
augroup END

""" Register
"" Clipboard
" yank
nnoremap <space>y "+y
xnoremap <space>y "+y
nnoremap <space>Y "+y$
xnoremap <space>Y "+y$
" delete
nnoremap <space>d "+d
nnoremap <space>D "+D
nnoremap <space>c "+c
nnoremap <space>C "+C
" paste
nnoremap <space>p "+p
xnoremap <space>p "+p
nnoremap <space>P "+P
xnoremap <space>P "+P
inoremap <c-r><c-space> <c-g>u<c-r>+
inoremap <c-r><space>   <c-g>u<c-r>+

"" Unnamed Register
inoremap <c-r>'         <c-g>u<c-r>"
inoremap <c-r><c-'>'    <c-g>u<c-r>"

"" Yank Register
" Kill Ambiguities
nnoremap Y y$
" CAUTION: not for xmap, or that makes delay.
nnoremap yp "0p
nnoremap yP "0P

"" Black-Hole
nnoremap <space>x "_x
nnoremap <space>s "_s
nnoremap <space>X "_X
nnoremap <space>S "_S

""" Visual Mode
"" Sort; Initial to Reverse Sort
" CAUTION: <c-s> freezes screen on some Linux-Distros as default.
"" Alphabetical
xnoremap <a-s>      :sort   <cr>
xnoremap <a-s><a-a> :sort   <cr>
xnoremap <a-s>a     :sort   <cr>
xnoremap <a-s>A     :sort!  <cr>
" Ignore Case
xnoremap <a-s><a-i> :sort  i<cr>
xnoremap <a-s>i     :sort  i<cr>
xnoremap <a-s>I     :sort! I<cr>
xnoremap <a-s><a-n> :sort  n<cr>
xnoremap <a-s>n     :sort  n<cr>
xnoremap <a-s>N     :sort! n<cr>
" Float Number
xnoremap <a-s><a-f> :sort  f<cr>
xnoremap <a-s>f     :sort  f<cr>
xnoremap <a-s>F     :sort! f<cr>
xnoremap <a-s><a-x> :sort  x<cr>
xnoremap <a-s>x     :sort  x<cr>
xnoremap <a-s>X     :sort! x<cr>
xnoremap <a-s><a-o> :sort  o<cr>
xnoremap <a-s>o     :sort  o<cr>
xnoremap <a-s>O     :sort! o<cr>

""" Terminal Mode
"" Put as in Insert Mode
tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'
" clipboard register
tnoremap <expr> <C-R><c-space> '<C-\><C-N>"+pi'
tnoremap <expr> <C-R><space>   '<C-\><C-N>"+pi'
"" yank register
tnoremap <expr> <C-R><c-0>     '<C-\><C-N>"0pi'
" Use emacs-like keybind in terminal-job mode.
"" ESC
" esc in the same way as in the other mode.
tnoremap <c-[> <c-\><c-n>
tnoremap <esc> <c-\><c-n>
