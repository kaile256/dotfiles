"" IME
" 0: IME will be off, when lmap is off.
" lmap supports 3 modes: Insert, Commandline and Lang-Arg.
inoremap <esc> <esc>:set iminsert=0<cr>
lnoremap <cr>  <cr>:set imsearch=0<cr>

"""" Tag
" when there are multiple tags, show list of tags.
nnoremap <c-]> g<c-]>
""" Insert Mode
""" back to normal mode, typing j&k simultaneously.
"inoremap jk <Esc>
"inoremap kj <Esc>

"""" hjkl
" move as it looks.
nnoremap j gj
nnoremap k gk
xnoremap j gj
xnoremap k gk

" swap roles.
nnoremap gj j
nnoremap gk k
xnoremap gj j
xnoremap gk k

"""" NormalMode
"" Convinience
nnoremap <c-g> ge
xnoremap <c-g> ge
"" Kill Ambiguities
nnoremap Y y$
nnoremap q: :q
nnoremap q; q:

""" Buffer
" jump to last buffer.
nnoremap <a-o> <c-^>

""" Research
" find researched word at middle
noremap n  nzz
noremap N  Nzz
noremap *  *zz
noremap #  #zz
noremap g* g*zz
noremap g# g#zz

"""" PANE
""" Pane: move
" CAUTION: i_alt-hjkl would be useful as <esc>hjkl.
" move between panes
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" avoid stack on command-line
cnoremap <c-k> <c-c>

" resize window by cursor keys
" move window itself
nnoremap <c-w>h <c-w>H
nnoremap <c-w>j <c-w>J
nnoremap <c-w>k <c-w>K
nnoremap <c-w>l <c-w>L

""" Pane:resize
nnoremap <left>  <c-w>>
nnoremap <down>  <c-w>-
nnoremap <up>    <c-w>+
nnoremap <right> <c-w><
" another-resize commands
nnoremap <a->> <c-w>>
nnoremap <a--> <c-w>-
nnoremap <a-+> <c-w>+
nnoremap <a-<> <c-w><
" agressive resize
nnoremap <c-w>m <c-w>_
nnoremap <c-w><c-m> <c-w>_<c-w>|
"nnoremap <c-w><s-M>     <c-w>_<c-w>|
" neutralize
nnoremap <c-w>0 <c-w>=

""" Tab Page
" send current tab to left.
nnoremap <a-h> gt
" send current tab to right.
nnoremap <a-l> gT

"""" SPACE
nnoremap <space> [None]

"" NoHighlight
" <c-l> is already used by window-leaping.
nnoremap <silent> <space>nh :noh<cr><c-l>

"""" Clipboard
" registor
nnoremap <space>y "+y
xnoremap <space>y "+y
nnoremap <space>d "+d
xnoremap <space>d "+d
" paste
nnoremap <space>p "+p
xnoremap <space>p "+p
nnoremap <space>P "+P
xnoremap <space>P "+P

""" Write and Quit
" w! write even read-only file.
nnoremap <space>w :<c-u>w<CR>
nnoremap <space>q :<c-u>q<CR>
nnoremap <space><S-W> :<c-u>w!<CR>
nnoremap <space><S-Q> :<c-u>q!<CR>

"""" ACCESS
"" History
nnoremap <space><space>/ :<c-r>q/<cr>
nnoremap <space><space>: :<c-r>q:<cr>
"" Help
nnoremap <space><space>h :<c-u>h 
"" Manpage
nnoremap <space><space>m :<c-u>Man 
"" Ready to edit
nnoremap <space><space>e :<c-u>e 
nnoremap <space><space>v :<c-u>vs 
nnoremap <space><space>s :<c-u>sp 
nnoremap <space><space>b :<c-u>tabe 

""" Tab Page
nnoremap <space>bp :tabprevious<cr>
nnoremap <space>bn :tabnext<cr>
nnoremap <space>bo :tabonly<cr>
nnoremap <space>bc :tabclose<cr>

"""" ALT
""" ADVANCED
"" Dot-Repeat
"" CAUTION: Never careless mapping on <a-hjkl>
"" Window Leap
inoremap <a-c-h> <esc><c-w>h
inoremap <a-c-j> <esc><c-w>j
inoremap <a-c-k> <esc><c-w>k
inoremap <a-c-l> <esc><c-w>l

"" Jump
nnoremap <a-;> ;.
nnoremap <a-n> n.

"" Registor
nnoremap <a-x> "_x
nnoremap <a-d> "_d
nnoremap <a-D> "_D
nnoremap <a-c> "_c
nnoremap <a-C> "_C

"" Checkhealth
noremap <a-c><a-h> :<c-u>checkhealth<cr>
noremap <a-c>h :<c-u>checkhealth<cr>
cnoremap <a-c><a-h> :<c-u>checkhealth<cr>
cnoremap <a-c>h :<c-u>checkhealth<cr>
"" Reload init.vim
noremap <a-s><a-o> :<c-u>so $XDG_CONFIG_HOME/nvim/init.vim<CR>
noremap <a-s>o :<c-u>so $XDG_CONFIG_HOME/nvim/init.vim<CR>
cnoremap <a-s><a-o> :<c-u>so $XDG_CONFIG_HOME/nvim/init.vim<CR>
cnoremap <a-s>o :<c-u>so $XDG_CONFIG_HOME/nvim/init.vim<CR>

"""" Dein
" install plugins
noremap <a-d><a-i> :<c-u>call dein#install()<cr>
noremap <a-d>i :<c-u>call dein#install()<cr>
cnoremap <a-d><a-i> :<c-u>call dein#install()<cr>
cnoremap <a-d>i :<c-u>call dein#install()<cr>

" update plugins
noremap <a-d><a-u> :<c-u>call dein#update()<cr>
noremap <a-d>u :<c-u>call dein#update()<cr>
cnoremap <a-d><a-u> :<c-u>call dein#update()<cr>
cnoremap <a-d>u :<c-u>call dein#update()<cr>

