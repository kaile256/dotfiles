"""" From: init.vim

"""" CONFIG
" cursor position of column is kept on jump.
set nostartofline
" jump ignoring unwritten buffers.
set hidden

""" Search
set noignorecase
" sensitive to case only with upper case.
"set smartcase 
set incsearch
set hlsearch
set nowrapscan
" fold all lines unmatched on {pattern}.
set foldenable

"""" KEYMAP
""" hjkl
" move as it looks.
nnoremap j gj
nnoremap k gk
xnoremap j gj
xnoremap k gk
" switch mapping.
nnoremap gj j
nnoremap gk k
xnoremap gj j
xnoremap gk k

""" Advanced jk/HML
" <a-hjkl> get along with <s-wbe>,
" though <c-hjkl> get along with <c-fbud>;
"nnoremap <silent> <a-h> :<c-r>=(               virtcol('.')) /2<cr>h
"nnoremap <silent> <a-l> :<c-r>=(virtcol('0') - virtcol('.')) /2<cr>l
map <silent> <c-j> [ToWinBottom]
map <silent> <c-k> [ToWinTop]
" CAUTION: <c-m> is identical with <cr>.
map <silent> <a-m> [ToWinMiddle]
map <silent> <c-u> [ToWinMiddle]
map <silent> <c-i> [ToWinMiddle]

""" Go-To
" switch mapping
noremap gf gF
noremap gF gf
"noremap gd gD
"noremap gD gd

""” Research
"" TODO: setlocal show result w/ no-file path but only file name.
"" Grep to QuickFix  # no dirty-hist
nnoremap <space>/ :silent vimgrep  % <bar> cw<Left><Left><Left><Left><Left><Left><Left>

"" Dot-Repeat
nnoremap <a-n> n.
nnoremap <a-;> ;.
" researched word will come up at middle of current window.
noremap n   nzz
noremap N   Nzz
noremap *   *zz
noremap #   #zz
noremap g* g*zz
noremap g# g#zz

""" Tag
"" Show List
" show list of tags only when there are more than two tags.
"" Jump
noremap <c-]> g<c-]>
"" Newer Tag
noremap <silent> <a-]> :tag<cr>
"" Older Tag
noremap <silent> <a-[> :pop<cr>
"" Last Tag
noremap <silent> <a-}> :0tag<cr>
" TODO: ???
noremap <silent> <a-{> :$tag<cr>

""" Pane
" leap between panes
noremap <a-h> <c-w>h
noremap <a-j> <c-w>j
noremap <a-k> <c-w>k
noremap <a-l> <c-w>l

noremap <a-b> <c-w>b
noremap <a-t> <c-w>t
" avoid stack on command-line
cnoremap <a-k> <c-c>

""" Tab Page
" mnemonic: <s-,>/<s-.> are < & >.
noremap <c-x><c-h> gT
noremap <c-x><c-l> gt
noremap <c-x>h gT
noremap <c-x>l gt
noremap <c-h> gT
noremap <c-l> gt
"" Give Tab
noremap <c-w><c-t> <c-w>T

""" Buffer
" <c-[> to <esc>, <c-]> for tag-jump.
noremap <silent> <c-n> :next<cr>
noremap <silent> <c-p> :previous<cr>
noremap <silent> <c-}> :bfirst<cr>
noremap <silent> <c-{> :blast<cr>
noremap <c-6> <c-^>

"" QuickFix
noremap <silent> <space>co :copen<cr>
noremap <silent> <space>cw :cwindow<cr>
noremap <silent> <space>cc :cclose<cr>
noremap <silent> <space>cc :cclose<cr>
augroup QuickFixJump
  au!
  au FileType qf nnoremap <buffer> <a-]> :cprevious<cr>
  au FileType qf nnoremap <buffer> <a-[> :cnext<cr>
  au FileType qf nnoremap <buffer> <a-}> :cfirst<cr>
  au FileType qf nnoremap <buffer> <a-{> :clast<cr>
augroup END

"""" DEFINITION
noremap [ToWinTop]    :<c-u><c-r>= (line('w0') + line('.'))/2<cr><cr>
noremap [ToWinBottom] :<c-u><c-r>= (line('w$') + line('.') + 1)/2<cr><cr>
noremap [ToWinMiddle] :<c-u><c-r>= (line('w0') + line('w$') + 2*line('.'))/4<cr><cr>
