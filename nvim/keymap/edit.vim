" from: init.vim

augroup FcitxRemoteToggle "{{{
  if &imdisable == 0
    au!
    au VimEnter    * nested call system('fcitx-remote -s ssk')
    au InsertEnter * nested call system('fcitx-remote -o')
    au InsertLeave * nested call system('fcitx-remote -c')
  endif
augroup END "}}}

" Set; IME {{{
" 0: ime will be off, when lmap is off.
" lmap supports 3 modes: insert, commandline and lang-arg.
set iminsert=0
set imsearch=0
set imcmdline
"}}}

" Set; Tab&Indent {{{
""" Tab-Char
" insert spaces, instead of a tab-char.
set expandtab
" number of spaces, inserted by tab-key, that a tab-char counts for.
set tabstop=2
" number of spaces, inserted by tab-key, next to tab-chars.
set softtabstop=2

""" Tab&Indent; Indent
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
"}}}

augroup MyVimDiffAugroup "{{{
  au!

  function! s:my_vimdiff_keymap() "{{{
    nnoremap <buffer><silent> dq :diffoff!
    nnoremap <buffer><silent> d? :h fugitive_d
  endfunction "}}}

  au BufRead * if &diff == 1 | call <SID>my_vimdiff_keymap() | endif
augroup END "}}}

" Keymap; Write&Quit {{{
"" Write&Quit; Evacuation for Macro
nnoremap q<space> q
"" Write&Quit; wq
nnoremap          <space>w :<c-u>w  <cr>
nnoremap          <space>W :<c-u>w! <cr>
" Note: <space>q is sometimes mistyped, intending <space>w.
nnoremap          <space>q :<c-u>w  <cr>
nnoremap <silent> qq :<c-u>q  <cr>
nnoremap <silent> <space>Q :<c-u>q! <cr>
nnoremap <silent> <s-space>Q :<c-u>q! <cr>
"" Write&Quit; Buffer
nnoremap <silent> <space>Z :<c-u>q!<cr>
nnoremap <silent> <s-space>Z :<c-u>q!<cr>
"" Write&Quit; Special
nnoremap <space>* :<c-u>qa<cr>
nnoremap <space>! :w !sudo tee % > /dev/null<cr> <bar> edit!
"}}}

" Keymap; Emacs-like {{{
cnoremap <c-a> <home>
cnoremap <a-f> <S-right>
cnoremap <c-f> <right>
cnoremap <c-b> <left>
cnoremap <a-b> <S-left>
cnoremap <c-d> <Del>
"}}}

" Keymap; Cancel {{{
onoremap <a-h> <ESC>h
onoremap <a-j> <ESC>j
onoremap <a-k> <ESC>k
onoremap <a-l> <ESC>l
onoremap <a-w> <ESC>w
onoremap <a-b> <ESC>b
onoremap <a-e> <ESC>e
onoremap <a-s-w> <ESC>W
onoremap <a-s-b> <ESC>B
onoremap <a-s-e> <ESC>E
cnoremap <a-h> <c-c><c-w>h
cnoremap <a-j> <c-c><c-w>j
cnoremap <a-k> <c-c>
cnoremap <a-l> <c-c><c-w>l
" <c-k> enter digraph
cnoremap <c-k><a-k> <c-c>
"}}}

" Keymap; Improved {{{
"" Improved; <C-O> {{{
" <c-o>u doesn't work by default
inoremap <c-o>u     <esc>ui
inoremap <c-o><c-r> <esc><c-r>i
"}}}

"" Improved; <C-G> {{{
inoremap <c-g><c-h> <Left>
inoremap <c-g>h     <Left>
inoremap <c-g><c-l> <Right>
inoremap <c-g>l     <Right>
inoremap <c-g><c-b> <S-Left>
inoremap <c-g>b     <S-Left>
inoremap <c-g><c-w> <S-Right>
inoremap <c-g>w     <S-Right>
"}}}
"}}}

" Keymap; <Alt> as <ESC> {{{
" CAUTION: Never careless mapping on <i_a-hjkl>

"" Alt-ESC; <a-'original'> {{{
inoremap <a-space> <esc>:w<cr>
"}}}

"" Alt-ESC; <a-hjkl> {{{
"  make sure <a-hjkl> work as <esc>hjkl, e.g., while pop-up menu shows.
" CAUTION: Remember n_<a-hjkl> for Win-Leap
inoremap <nowait> <a-h> <esc>h
inoremap <nowait> <a-j> <esc>j
inoremap <nowait> <a-k> <esc>k
inoremap <nowait> <a-l> <esc>l
"}}}

"" Alt-ESC; <a-web> {{{
inoremap <nowait> <a-w>   <esc>w
inoremap <nowait> <a-b>   <esc>b
inoremap <nowait> <a-e>   <esc>e
inoremap <nowait> <a-s-w> <esc>W
inoremap <nowait> <a-s-b> <esc>B
inoremap <nowait> <a-s-e> <esc>E
"}}}

"" Alt-ESC; <a-ydcup> {{{
inoremap <nowait> <a-y>   <esc>y
inoremap <nowait> <a-x>   <esc>x
inoremap <nowait> <a-d>   <esc>d
inoremap <nowait> <a-c>   <esc>c
inoremap <nowait> <a-u>   <esc>u
inoremap <nowait> <a-c-r> <esc><c-r>
inoremap <nowait> <a-p>   <c-g>u<esc>p
inoremap <nowait> <a-s-p> <c-g>u<esc>P
inoremap <nowait> <a-s-y> <esc>y$
inoremap <nowait> <a-s-x> <esc>X
inoremap <nowait> <a-s-d> <esc>D
inoremap <nowait> <a-s-c> <esc>C

" Note: 'U' respects vi-compatible way of `uu`.
inoremap <nowait> <a-s-u> <esc>U
inoremap <nowait> <a-s-p> <c-g>u<esc>P

""" A-ydcup; for another type {{{
inoremap <nowait> <a-y><a-y> <esc>yy
inoremap <nowait> <a-y><a-i> <esc>yi
inoremap <nowait> <a-y><a-a> <esc>ya

inoremap <nowait> <a-y><a-w> <esc>yw
inoremap <nowait> <a-y><a-b> <esc>yb
inoremap <nowait> <a-y><a-e> <esc>ye

inoremap <nowait> <a-d><a-d> <esc>dd
inoremap <nowait> <a-d><a-i> <esc>di
inoremap <nowait> <a-d><a-a> <esc>da

inoremap <nowait> <a-d><a-w> <esc>dw
inoremap <nowait> <a-d><a-b> <esc>db
inoremap <nowait> <a-d><a-e> <esc>de

inoremap <nowait> <a-c><a-c> <esc>cc
inoremap <nowait> <a-c><a-i> <esc>ci
inoremap <nowait> <a-c><a-a> <esc>ca

inoremap <nowait> <a-c><a-w> <esc>cw
inoremap <nowait> <a-c><a-b> <esc>cb
inoremap <nowait> <a-c><a-e> <esc>ce
"}}}
"}}}

"" Alt-ESC; <a-iao> "{{{
" <a-ai> could be just <left>/<right>, but I prefer <esc> before.
inoremap <nowait> <a-a>   <esc>la
inoremap <nowait> <a-i>   <esc>i
inoremap <nowait> <a-o>   <esc>o
inoremap <nowait> <a-s-o> <esc>O
inoremap <nowait> <a-s-i> <esc>I
inoremap <nowait> <a-s-a> <esc>A
"}}}
"}}}

" Keymap; Exchange {{{
" gR: replaces tab-chars as collection of spaces.
noremap R gR
noremap gR R
"}}}
" Keymap; Undo-Break {{{
" CAUTION: <c-d> increases indent on Insert Mode.

"" New Line
inoremap <c-j> <c-g>u<c-j>
inoremap <c-m> <c-g>u<c-m>
"" Backspace
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>
"" Put
inoremap <c-r> <c-g>u<c-r>
inoremap <c-x> <c-g>u<c-x>
"" Insert Previously's
inoremap <c-a> <c-g>u<c-a>
inoremap <c-@> <c-g>u<c-@>
"" Digraph
inoremap <c-k> <c-g>u<c-k>
"" Non-Digit
inoremap <c-q> <c-g>u<c-q>
inoremap <c-v> <c-g>u<c-v>

augroup AdditionalUndoBreakOnFileType "{{{
  au!
  au FileType html,markdown inoremap <buffer> , ,<c-g>u
  au FileType html,markdown inoremap <buffer> . .<c-g>u
  au FileType html,markdown inoremap <buffer> ! !<c-g>u
  au FileType html,markdown inoremap <buffer> ? ?<c-g>u
augroup END "}}}
"}}}

" Keymap; Register {{{
"" Register; on Term-mode
""" Term; Put as in Insert Mode
tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'

"" Register; Sequence
" NOTICE: p on Visual is better without `].
"nnoremap p p

"" Register; Command-Line Register
inoremap <c-r><c-;> <c-g>u<c-r>:
inoremap <c-r>;     <c-g>u<c-r>:
cnoremap <c-r><c-;> <c-r>:
cnoremap <c-r>;     <c-r>:

"" Register; Black-Hole Register
nnoremap <space>x   "_x
nnoremap <space>s   "_s
nnoremap <space>X   "_X
nnoremap <space>S   "_S
nnoremap <S-space>X "_X
nnoremap <S-space>S "_S

""" Register; Plus Register (or Clipboard) {{{
"""" Plus; Terminal
tnoremap <expr> <C-R><c-space> '<C-\><C-N>"+pi'
tnoremap <expr> <C-R><space>   '<C-\><C-N>"+pi'

""" Plus; Yank
nnoremap <space>y "+y
xnoremap <space>y "+y
nnoremap <space>Y "+y$
xnoremap <space>Y "+y$

""" Plus; Delete
nnoremap <space>d "+d
nnoremap <space>D "+D
nnoremap <space>c "+c
nnoremap <space>C "+C

""" Plus; Put
nnoremap <space>p "+p']
xnoremap <space>p "+p
nnoremap <space>P "+P
xnoremap <space>P "+P
inoremap <c-r><c-space> <c-g>u<c-r>+
inoremap <c-r><space>   <c-g>u<c-r>+
cnoremap <c-r><c-space> <c-r>+
cnoremap <c-r><space>   <c-r>+
"}}}

"" Register; Yank Register {{{
nnoremap Y y$
nnoremap yk ykj
nnoremap dk dkk

""" Yank Register; Paste
tnoremap <c-r><c-0> <c-\><c-n>"0pi
tnoremap <c-r><c-o> <c-\><c-n>"0pi
tnoremap <c-r>o     <c-\><c-n>"0pi

nnoremap <c-p>      "0p`]
nnoremap <nowait> <c-s-p>    "0P

vnoremap <c-p>      "0p
vnoremap <nowait> <c-s-p>    "0P

inoremap <c-r><c-0> <c-g>u<c-r>0
inoremap <c-r><c-o> <c-g>u<c-r>0
inoremap <c-r>o     <c-g>u<c-r>0

cnoremap <c-r><c-0> <c-r>0
cnoremap <c-r><c-o> <c-r>0
cnoremap <c-r>o     <c-r>0
"}}}

"" Register; Unnamed Register "{{{
" CAUTION: Just Type p to put from unnamed register.
inoremap <c-r><c-p> <c-g>u<c-r>"
inoremap <c-r>p     <c-g>u<c-r>"
inoremap <c-r><c-'> <c-g>u<c-r>"
inoremap <c-r>'     <c-g>u<c-r>"
inoremap <c-r><c-\> <c-g>u<c-r>"
inoremap <c-r>\     <c-g>u<c-r>"
cnoremap <c-r><c-'> <c-r>"
cnoremap <c-r>'     <c-r>"
cnoremap <c-r><c-\> <c-r>"
cnoremap <c-r>\     <c-r>"

"" Unnamed; QuickEdit
" TODO: Do NOT mess up registers.
" don't let register dirty
nnoremap <silent> yP yyP
nnoremap <silent> yp yyp
nnoremap <silent> cp ddp
nnoremap <silent> cP ddkP
"}}}
"}}}

" Sort; Unique {{{
" Note: Initial Case to Reverse Sort
" CAUTION: <c-s> freezes screen on some Linux-Distros as default.
"" Alphabetical
xnoremap <a-s>      :sort  u<cr>
xnoremap <a-s><a-a> :sort  u<cr>
xnoremap <a-s>a     :sort  u<cr>
xnoremap <a-s>A     :sort! u<cr>
" Ignore Case
xnoremap <a-s><a-i> :sort  iu<cr>
xnoremap <a-s>i     :sort  iu<cr>
xnoremap <a-s>I     :sort! Iu<cr>
xnoremap <a-s><a-n> :sort  nu<cr>
xnoremap <a-s>n     :sort  nu<cr>
xnoremap <a-s>N     :sort! nu<cr>
" Float Number
xnoremap <a-s><a-f> :sort  fu<cr>
xnoremap <a-s>f     :sort  fu<cr>
xnoremap <a-s>F     :sort! fu<cr>
xnoremap <a-s><a-x> :sort  xu<cr>
xnoremap <a-s>x     :sort  xu<cr>
xnoremap <a-s>X     :sort! xu<cr>
xnoremap <a-s><a-o> :sort  ou<cr>
xnoremap <a-s>o     :sort  ou<cr>
xnoremap <a-s>O     :sort! ou<cr>
"}}}
" Sort; Ununique {{{
""" Alphabetical
"xnoremap <space><a-s>      :sort  <cr>
"xnoremap <space><a-s><a-a> :sort  <cr>
"xnoremap <space><a-s>a     :sort  <cr>
"xnoremap <space><a-s>A     :sort! <cr>
"" Ignore Case
"xnoremap <space><a-s><a-i> :sort  i<cr>
"xnoremap <space><a-s>i     :sort  i<cr>
"xnoremap <space><a-s>I     :sort! I<cr>
"xnoremap <space><a-s><a-n> :sort  n<cr>
"xnoremap <space><a-s>n     :sort  n<cr>
"xnoremap <space><a-s>N     :sort! n<cr>
"" Float Number
"xnoremap <space><a-s><a-f> :sort  f<cr>
"xnoremap <space><a-s>f     :sort  f<cr>
"xnoremap <space><a-s>F     :sort! f<cr>
"xnoremap <space><a-s><a-x> :sort  x<cr>
"xnoremap <space><a-s>x     :sort  x<cr>
"xnoremap <space><a-s>X     :sort! x<cr>
"xnoremap <space><a-s><a-o> :sort  o<cr>
"xnoremap <space><a-s>o     :sort  o<cr>
"xnoremap <space><a-s>O     :sort! o<cr>
""}}}

" Keymap; Fold
" Uniquely Open Fold; close all the others
noremap zu zMzv
