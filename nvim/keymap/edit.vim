" From: init.vim

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
" Improve; <C-O> {{{
" <c-o>u doesn't work by default
inoremap <c-o>u     <esc>ui
inoremap <c-o><c-r> <esc><c-r>i
"}}}
" Improve; <C-G> {{{
inoremap <c-g><c-h> <Left>
inoremap <c-g>h     <Left>
inoremap <c-g><c-l> <Right>
inoremap <c-g>l     <Right>
inoremap <c-g><c-b> <S-Left>
inoremap <c-g>b     <S-Left>
inoremap <c-g><c-w> <S-Right>
inoremap <c-g>w     <S-Right>
"}}}

" CAUTION: Never careless mapping on <i_a-hjkl>
" Alt-ESC; <a-'original'> {{{
inoremap <a-space> <esc>:w<cr>
"}}}
" Alt-ESC; <a-hjkl> {{{
"  make sure <a-hjkl> work as <esc>hjkl, e.g., while pop-up menu shows.
" CAUTION: Remember n_<a-hjkl> for Win-Leap
inoremap <nowait> <a-h> <esc>h
inoremap <nowait> <a-j> <esc>j
inoremap <nowait> <a-k> <esc>k
inoremap <nowait> <a-l> <esc>l
"}}}
" Alt-ESC; <a-web> {{{
inoremap <nowait> <a-w>   <esc>w
inoremap <nowait> <a-b>   <esc>b
inoremap <nowait> <a-e>   <esc>e
inoremap <nowait> <a-s-w> <esc>W
inoremap <nowait> <a-s-b> <esc>B
inoremap <nowait> <a-s-e> <esc>E
"}}}
" Alt-ESC; <a-ydcup> {{{
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
" Alt-ESC; <a-iao> "{{{
" <a-ai> could be just <left>/<right>, but I prefer <esc> before.
inoremap <nowait> <a-a>   <esc>la
inoremap <nowait> <a-i>   <esc>i
inoremap <nowait> <a-o>   <esc>o
inoremap <nowait> <a-s-o> <esc>O
inoremap <nowait> <a-s-i> <esc>I
inoremap <nowait> <a-s-a> <esc>A
"}}}

" CAUTION: <c-d> increases indent on Insert Mode.
"" Undo Brea; New Line
"inoremap <c-j> <c-g>u<c-j>
"inoremap <c-m> <c-g>u<c-m>
" Undo Break; Backspace
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>
" Undo Break; Put
inoremap <c-r> <c-g>u<c-r>
inoremap <c-x> <c-g>u<c-x>
" Undo Break; Insert Previously's
inoremap <c-a> <c-g>u<c-a>
inoremap <c-@> <c-g>u<c-@>
" Undo Break; Digraph
inoremap <c-k> <c-g>u<c-k>
" Undo Break; Non-Digit
inoremap <c-q> <c-g>u<c-q>
inoremap <c-v> <c-g>u<c-v>

" Undo Keep; Inc/Decrement
" Too slow.
"nnoremap <c-x> <c-g>U<c-x>
"nnoremap <c-a> <c-g>U<c-a>

augroup AdditionalUndoBreakOnFileType "{{{
  au!
  au FileType html,markdown inoremap <buffer> , ,<c-g>u
  au FileType html,markdown inoremap <buffer> . .<c-g>u
  au FileType html,markdown inoremap <buffer> ! !<c-g>u
  au FileType html,markdown inoremap <buffer> ? ?<c-g>u
augroup END "}}}

" Fold; Uniquely Open Fold {{{
" i.e., close all the others
noremap zu zMzv
"}}}

vnoremap <c-x> <c-x>gv
vnoremap <c-a> <c-x>gv
xnoremap = =gv
xnoremap < <gv
xnoremap > >gv

" Adjustment; Text Object {{{
onoremap ia a
onoremap ai i
xnoremap ia a
xnoremap ai i
"}}}
" Adjustment; Insert {{{
nnoremap dI I
nnoremap cI I
nnoremap yI I
nnoremap dA A
nnoremap cA A
nnoremap yA A
"}}}
" Adjustment; Operator {{{
nnoremap dY y$
nnoremap cY y$
nnoremap yY y$
nnoremap dD D
nnoremap cD D
nnoremap yD D
nnoremap cC C
nnoremap dC C
nnoremap yC C
"}}}
