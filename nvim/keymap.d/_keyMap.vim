""" Insert Mode
"" back to normal mode, typing j&k simultaneously.
inoremap jk <Esc>
inoremap kj <Esc>
"""" hjkl
" move as you look.
nnoremap j gj
nnoremap k gk
xnoremap j gj
xnoremap k gk

""" NormalMode
" Kill Ambiguities
nnoremap Y y$

"" Research
" find researched word at middle
noremap n  nzz
noremap N  Nzz
noremap *  *zz
noremap #  #zz
noremap g* g*zz
noremap g# g#zz

""" Pane
"" Pane: move
" CAUTION: alt-hjkl would be useful as <esc>hjkl.
" move between panes
nnoremap <c-h>      <c-w>h
nnoremap <c-j>      <c-w>j
nnoremap <c-k>      <c-w>k
nnoremap <c-l>      <c-w>l
" resize window by cursor keys
" move window itself
nnoremap <c-w>h     <c-w>H
nnoremap <c-w>j     <c-w>J
nnoremap <c-w>k     <c-w>K
nnoremap <c-w>l     <c-w>L
"" Pane:resize
nnoremap <Left>     <c-w>>
nnoremap <Down>     <c-w>-
nnoremap <Up>       <c-w>+
nnoremap <Right>    <c-w><
" agressive resize
nnoremap <c-w>m     <c-w>_
nnoremap <c-w><c-m> <c-w>_
nnoremap <c-w>M     <c-w>_<c-w>|
" neutralize
nnoremap <c-w>0 <c-w>=

"" Terminal Mode
" Normal-mode-like move on terminal mode
tnoremap <c-[> <c-\><c-n>
tnoremap <ESC> <c-\><c-n>
