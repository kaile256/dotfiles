""" Insert Mode
"" back to normal mode, typing j&k simultaneously.
inoremap jk <Esc>
inoremap kj <Esc>
"""" hjkl
" DONT map i_<c-h>/<c-j>; should be default.
inoremap <a-h> <Left>
inoremap <a-j> <Down>
inoremap <a-k> <Up>
inoremap <a-l> <Right>
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
noremap n nzz
noremap N Nzz
noremap * *zz
noremap # #zz
noremap g* g*zz
noremap g# g#zz

""" Pane
"" Pane:move
" move between panes
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" move window itself
nnoremap <a-h> <C-w>H
nnoremap <a-k> <C-w>J
nnoremap <a-j> <C-w>K
nnoremap <a-l> <C-w>L
"" Pane:resize
" resize window by cursor keys
nnoremap <c-w>h <c-w>>
nnoremap <C-w>j <C-w>-
nnoremap <C-w>k <C-w>+
nnoremap <C-w>l <C-w><
" agressive resize
nnoremap <C-w>m     <c-w>_
nnoremap <C-w><C-m> <c-w>_
nnoremap <C-w>M     <c-w>_<C-w>|
" neutralize
nnoremap <c-w>0 <c-w>=

"" Terminal Mode
" Normal-mode-like move on terminal mode
tnoremap <C-[> <C-\><C-n>
tnoremap <ESC> <C-\><C-n>
