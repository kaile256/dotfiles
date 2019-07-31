"""" From: init.vim

"""" DEFINITION
noremap [ToWinTop]    :<c-u><c-r>= (line('w0') + line('.'))/2<cr><cr>
noremap [ToWinBottom] :<c-u><c-r>= (line('w$') + line('.') + 1)/2<cr><cr>
noremap [ToWinMiddle] :<c-u><c-r>= (line('w0') + line('w$') + 2*line('.'))/4<cr><cr>

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
" CAUTION: foldable is apt to collapse format.
set nofoldenable

""" Buffer
augroup HelpIntoBufferList
  "au! BufReadPost help drop %
  au! BufReadPost * if &buftype ==# 'help' | drop % | endif
augroup END

"""" KEYMAP
""" Working Directory
nnoremap <a-w><a-w> :cd %:p:h<cr>
nnoremap <a-w>w     :cd %:p:h<cr>
nnoremap <a-w><a-h> :cd ~<cr>
nnoremap <a-w>h     :cd ~<cr>
nnoremap <a-w><a-f> :cd ~/.config<cr>
nnoremap <a-w>f     :cd ~/.config<cr>
nnoremap <a-w><a-d> :cd ~/dotfiles<cr>
nnoremap <a-w>d     :cd ~/dotfiles<cr>
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
map <silent> <a-j> [ToWinBottom]
map <silent> <a-k> [ToWinTop]
" CAUTION: <c-m> is identical with <cr>; <c-,>/<c-.> does't work.
map <silent> <a-m> [ToWinMiddle]

""" Pane
" leap between panes
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

nnoremap <a-b> <c-w>b
nnoremap <a-t> <c-w>t
" avoid stack on command-line
cnoremap <a-k> <c-c>

""" Tab Page
" mnemonic: <s-,>/<s-.> are < & >.
nnoremap <a-h> gT
nnoremap <a-l> gt
nnoremap <c-x><c-h> gT
nnoremap <c-x><c-l> gt
nnoremap <c-x>h gT
nnoremap <c-x>l gt

"" Give Tab
nnoremap <c-w><c-t> <c-w>T

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

""" Terminal
if has('nvim')
  """" KEYMAP
  """ Normal Mode
  "" Open Shortcut
  nnoremap <silent> <a-t><a-e> :<c-u>        :te<cr>
  nnoremap <silent> <a-t><a-s> :<c-u>sp<cr>  :te<cr>
  nnoremap <silent> <a-t><a-v> :<c-u>vs<cr>  :te<cr>
  nnoremap <silent> <a-t><a-b> :<c-u>tabe<cr>:te<cr>

  """ Terminal Mode
  " Use emacs-like keybind in terminal-job mode.
  "" ESC
  " esc in the same way as in the other mode.
  tnoremap <c-[> <c-\><c-n>
  tnoremap <esc> <c-\><c-n>

  "" Alt as ESC as in Insert Mode
  " esc & hjkl
  tnoremap <a-h> <c-\><c-n>h
  tnoremap <a-j> <c-\><c-n>j
  tnoremap <a-k> <c-\><c-n>k
  tnoremap <a-l> <c-\><c-n>l

  " esc & backward
  tnoremap <a-w> <c-\><c-n>w
  tnoremap <a-b> <c-\><c-n>b
endif

""" Buffer
" <c-[> to <esc>, <c-]> for tag-jump.
noremap <silent> <c-n> :bnext<cr>
noremap <silent> <c-p> :bprevious<cr>
noremap <silent> <c-}> :bfirst<cr>
noremap <silent> <c-{> :blast<cr>
noremap <c-6> <c-^>

"" QuickFix
noremap <silent> <space>co :copen<cr>
noremap <silent> <space>cw :cwindow<cr>
noremap <silent> <space>cc :cclose<cr>:lclose<cr>

augroup QuickFixJump
  au!
  au FileType qf nnoremap <buffer> <a-]> :cprevious<cr>
  au FileType qf nnoremap <buffer> <a-[> :cnext<cr>
  au FileType qf nnoremap <buffer> <a-}> :cfirst<cr>
  au FileType qf nnoremap <buffer> <a-{> :clast<cr>
augroup END
