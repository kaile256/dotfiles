" From: init.vim

" makes <c-o>u work as if <c-u>
"nnoremap o o<c-g>u
"nnoremap O O<c-g>u

nnoremap j gj
nnoremap k gk
" switch mapping.
nnoremap gj j
nnoremap gk k

" TODO: make it work
"xnoremap <silent> gJ :*g/^\( \\|\t\)/norm! 0"_dwgJ<cr>

" Macro "{{{1
nnoremap \<space> q
nnoremap <space>\ q

" Write&Quit {{{1
if mapcheck('q', 'n') == ''
  nnoremap q <Nop>
endif
if mapcheck('Q', 'n') == ''
  nnoremap Q <Nop>
endif
" Write&Quit; wq
nnoremap <silent> <space>w :<c-u>up  <cr>
nnoremap <silent> <space>W :<c-u>up! <cr>
" Note: <space>q is sometimes mistyped, intending <space>w.
nnoremap <silent> <space>q :<c-u>up  <cr>
" Note: :undojoin causes an error just after :undo.
" TODO: :undojoin on :w prevents to go back undo-history
"nnoremap <silent> <space>w :<c-u>silent! undojoin <bar> w  <bar>silent! undojoin<cr>
"nnoremap <silent> <space>W :<c-u>silent! undojoin <bar> w! <bar>silent! undojoin<cr>
"" Note: <space>q is sometimes mistyped, intending <space>w.
"nnoremap <silent> <space>q :<c-u>silent! undojoin <bar> w  <bar>silent! undojoin<cr>

" Improve; i_<c-o> {{{1
" TODO: make <c-o>yi work, as <c-o>di, <c-o>ci.
"inoremap <c-o>y <esc>
"      \ :au TextYankPost * ++once norm! gi<cr>
"      \ y

" Cancel {{{2
onoremap <silent> <a-h> <ESC>:call feedkeys('h')<cr>
onoremap <silent> <a-j> <ESC>:call feedkeys('j')<cr>
onoremap <silent> <a-k> <ESC>:call feedkeys('k')<cr>
onoremap <silent> <a-l> <ESC>:call feedkeys('l')<cr>

" Fold; Uniquely Open Fold {{{1
" i.e., close all the others
noremap zU zMzv
