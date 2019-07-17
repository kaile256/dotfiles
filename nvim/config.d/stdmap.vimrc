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
nnoremap <c-h>      <c-w>h
nnoremap <c-j>      <c-w>j
nnoremap <c-k>      <c-w>k
nnoremap <c-l>      <c-w>l

" avoid stack on command-line
cnoremap <c-k> <c-c>

" resize window by cursor keys
" move window itself
nnoremap <c-w>h     <c-w>H
nnoremap <c-w>j     <c-w>J
nnoremap <c-w>k     <c-w>K
nnoremap <c-w>l     <c-w>L

""" Pane:resize
nnoremap <left>     <c-w>>
nnoremap <down>     <c-w>-
nnoremap <up>       <c-w>+
nnoremap <right>    <c-w><
" another-resize commands
nnoremap <a->>      <c-w>>
nnoremap <a-->      <c-w>-
nnoremap <a-+>      <c-w>+
nnoremap <a-<>      <c-w><
" agressive resize
nnoremap <c-w>m     <c-w>_
nnoremap <c-w><c-m> <c-w>_<c-w>|
"nnoremap <c-w><s-M>     <c-w>_<c-w>|
" neutralize
nnoremap <c-w>0 <c-w>=

""" Tab Page
" send current tab to left.
nnoremap <a-h> gt
" send current tab to right.
nnoremap <a-l> gT

"" Terminal Mode
if has('nvim')
  " Normal-mode-like move on terminal mode
  tnoremap <c-[> <c-\><c-n>
  tnoremap <ESC> <c-\><c-n>

  tnoremap <a-h> <c-\><c-n>h
  tnoremap <a-j> <c-\><c-n>j
  tnoremap <a-k> <c-\><c-n>k
  tnoremap <a-l> <c-\><c-n>l

  tnoremap <a-w> <c-\><c-n>w
  tnoremap <a-b> <c-\><c-n>b
endif
