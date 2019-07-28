"""" from: init.vim

"""" config
""" ime
" 0: ime will be off, when lmap is off.
" lmap supports 3 modes: insert, commandline and lang-arg.
augroup AutoOffIME
  au!
  au InsertLeave  * set iminsert=0
  au CmdlineLeave * set imsearch=0
augroup end

""" terminal
if has('terminal')
  augroup ModifiableTermMode
    au! TermOpen * setlocal modifiable
  augroup end
endif

""" tab-char
" insert spaces, instead of a tab-char.
set expandtab
" number of spaces, inserted by tab-key, that a tab-char counts for.
set tabstop=2
" number of spaces, inserted by tab-key, next to tab-chars.
set softtabstop=2

augroup ReplaceTabWithSpace
  " :retab!; if replace spaces, too.
  au! BufReadPost,BufEnter *
        \ if ! &readonly || &modifiable | retab | endif
augroup end

""" indent
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

augroup resizeindent
  au!
  au FileType JavaScript setlocal shiftwidth=4 tabstop=4 softtabstop=4
  au FileType Ruby       setlocal shiftwidth=2 tabstop=2 softtabstop=2
  au FileType Python     setlocal shiftwidth=2 tabstop=2 softtabstop=2
augroup end

""" regiser
set clipboard+=unnamedplus,unnamed

""" visual mode
" visualize even if there is no chars.
set virtualedit=block

""" commandline mode
set noshowcmd
" activate completion on command-line
set wildmenu
set wildmode=list:longest
"set history=10000

""" pop-up menu
set pumheight=50
"is has('nvim') || 
"  set wildoptions=pum
"  set pumblend=20
"endif

"""" keymap
""" advanced <c-g>
inoremap <c-g><c-h> <left>
inoremap <c-g>h     <left>
inoremap <c-g><c-l> <right>
inoremap <c-g>l     <right>
inoremap <c-g><c-b> <s-left>
inoremap <c-g>b     <s-left>
inoremap <c-g><c-w> <s-right>
inoremap <c-g>w     <s-right>

""" menupopup
"" alt-esc; or type <c-o> to insert-normal.
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
" <a-iao> as well; forget initial o.
inoremap <a-i> <esc>i
inoremap <a-a> <esc>a
inoremap <a-o> <esc>o

""" undo break
inoremap <c-j> <c-g>u<c-j>
"" put
inoremap <c-r> <c-g>u<c-r>
"" backspace
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>

augroup undobreakonfiletype
  au!
  au filetype html,markdown inoremap <buffer> , ,<c-g>u
  au filetype html,markdown inoremap <buffer> . .<c-g>u
  au filetype html,markdown inoremap <buffer> ! !<c-g>u
  au filetype html,markdown inoremap <buffer> ? ?<c-g>u
augroup end

""" register
"" yank
nnoremap <space>y "+y
xnoremap <space>y "+y

"" paste
nnoremap <space>p "+p
xnoremap <space>p "+p
nnoremap <space>p "+p
xnoremap <space>p "+p
" caution: not for xmap, or that makes delay.
nnoremap yp "0p
nnoremap yp "0p

"" black-hole
nnoremap <space>x "_x
nnoremap <space>d "_d
nnoremap <space>c "_c

""" Visual Mode
"" Sort; Initial to Reverse Sort
" CAUTION: <c-s> freezes screen on some Linux-Distros as default.
xnoremap <a-s><c-a> :sort   <cr>
xnoremap <a-s>a     :sort   <cr>
xnoremap <a-s>A     :sort!  <cr>
" Ignore Case
xnoremap <a-s><c-i> :sort  i<cr>
xnoremap <a-s>i     :sort  i<cr>
xnoremap <a-s>I     :sort! I<cr>
xnoremap <a-s><c-n> :sort  n<cr>
xnoremap <a-s>n     :sort  n<cr>
xnoremap <a-s>N     :sort! n<cr>
" Float Number
xnoremap <a-s><c-f> :sort  f<cr>
xnoremap <a-s>f     :sort  f<cr>
xnoremap <a-s>F     :sort! f<cr>
xnoremap <a-s><c-x> :sort  x<cr>
xnoremap <a-s>x     :sort  x<cr>
xnoremap <a-s>X     :sort! x<cr>
xnoremap <a-s><c-o> :sort  o<cr>
xnoremap <a-s>o     :sort  o<cr>
xnoremap <a-s>O     :sort! o<cr>
