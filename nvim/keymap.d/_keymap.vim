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
" resize window by cursor keys
" move window itself
nnoremap <c-w>h <C-w>H
nnoremap <C-w>j <C-w>J
nnoremap <C-w>k <C-w>K
nnoremap <C-w>l <C-w>L
"" Pane:resize
nnoremap <a-h> <c-w>>
nnoremap <a-k> <C-w>-
nnoremap <a-j> <C-w>+
nnoremap <a-l> <C-w><
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
