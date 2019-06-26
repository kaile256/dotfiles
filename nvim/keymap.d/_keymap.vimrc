""" Insert Mode
"" back to normal mode, typing j&k simultaneously.
inoremap jk <Esc>
inoremap kj <Esc>
""" windows-like
"inoremap <c-z> <c-o>u
""" emacs-like
"" top to end
"inoremap <c-a> <c-o>^
"inoremap <c-e> <c-o>$
"" hjkl
"inoremap <c-f> <c-o>w
"inoremap <c-b> <c-o>b
"inoremap <c-n> <Down>
"inoremap <c-p> <Up>

""" NormalMode
" Kill Ambiguities
nnoremap Y y$
nnoremap q: :q

"" Put an empty without insert mode
nnoremap <a-o> o<esc>k
nnoremap <a-O> O<esc>j
nnoremap <a-i> I<space><esc>l
nnoremap <a-a> A<space><esc>h

"" Research
" find researched word at middle
noremap n nzz
noremap N Nzz
noremap * *zz
noremap # #zz
noremap g* g*zz
noremap g# g#zz

"" Pane
" resize window by cursor keys
noremap <a-h> <C-w>>
noremap <a-j> <C-w>-
noremap <a-k> <C-w>+
noremap <a-l> <C-w><
" agressive resize
noremap <C-w>m     <c-w>_
noremap <C-w><C-m> <c-w>_
noremap <C-w>M     <c-w>_<C-w>|
" neutralize
noremap <c-w>0 <c-w>=

" move around
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
" move window itself
nmap <C-w><C-h> <C-w>H
nmap <C-w><C-j> <C-w>J
nmap <C-w><C-k> <C-w>K
nmap <C-w><C-l> <C-w>L

"" Terminal Mode
" Normal-mode-like move on terminal mode
tnoremap <C-[> <C-\><C-n>
tnoremap <ESC> <C-\><C-n>

tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l
