"""" Memo: leap.org
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
" CAUTION: foldable is apt to collapse format.
set nofoldenable

"""" KEYMAP
""" Current Directory
nnoremap <a-w><a-w> :cd %:p:h<cr>:echo '$CWD is "' . getcwd() . '"'<cr>
nnoremap <a-w>c     :cd %:p:h<cr>:echo '$CWD is "' . getcwd() . '"'<cr>
"" Root Directory
nnoremap <a-w><a-r> :cd /<cr>:echo '$CWD is "' . getcwd() . '"'<cr>
nnoremap <a-w>r     :cd /<cr>:echo '$CWD is "' . getcwd() . '"'<cr>
"" $HOME
nnoremap <a-w><a-h> :cd ~<cr>:echo '$CWD is "' . getcwd() . '"'<cr>
nnoremap <a-w>h     :cd ~<cr>:echo '$CWD is "' . getcwd() . '"'<cr>
"" XDG_CACHE_HOME
nnoremap <a-w><a-a> :cd ~/.cache<cr>:echo '$CWD is "' . getcwd() . '"'<cr>
nnoremap <a-w>a     :cd ~/.cache<cr>:echo '$CWD is "' . getcwd() . '"'<cr>
"" XDG_CONFIG_HOME
nnoremap <a-w><a-g> :cd ~/.config<cr>:echo '$CWD is "' . getcwd() . '"'<cr>
nnoremap <a-w>g     :cd ~/.config<cr>:echo '$CWD is "' . getcwd() . '"'<cr>
nnoremap <a-w><a-f> :cd ~/.config<cr>:echo '$CWD is "' . getcwd() . '"'<cr>
nnoremap <a-w>f     :cd ~/.config<cr>:echo '$CWD is "' . getcwd() . '"'<cr>
"" Dotfiles
nnoremap <a-w><a-d> :cd ~/dotfiles<cr>:echo '$CWD is "' . getcwd() . '"'<cr>
nnoremap <a-w>d     :cd ~/dotfiles<cr>:echo '$CWD is "' . getcwd() . '"'<cr>
nnoremap <a-w><a-.> :cd ~/dotfiles<cr>:echo '$CWD is "' . getcwd() . '"'<cr>
nnoremap <a-w>.     :cd ~/dotfiles<cr>:echo '$CWD is "' . getcwd() . '"'<cr>
"" Org-Mode
nnoremap <a-w><a-o> :cd ~/org<cr>:echo '$CWD is "' . getcwd() . '"'<cr>
nnoremap <a-w>o     :cd ~/org<cr>:echo '$CWD is "' . getcwd() . '"'<cr>

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
"" Definition
noremap <Plug>(leap-in-win-higher) :<c-u><c-r>= (line('w0') + line('.'))/2<cr><cr>
noremap <Plug>(leap-in-win-middle) :<c-u><c-r>= (line('w0') + line('w$') + 2*line('.'))/4<cr><cr>
noremap <Plug>(leap-in-win-lower)  :<c-u><c-r>= (line('w$') + line('.') + 1)/2<cr><cr>
noremap <Plug>(shift-to-middle)    :<c-u>call cursor(line('.'),col('$')/2)<cr>
" CAUTION: <c-m> is identical with <cr>; <c-,>/<c-.> does't work.
" <c-hjkl> get along with <c-fbud>; <a-hjkl> get along with <s-wbe>.
map <silent> <c-h> <Plug>(leap-in-win-middle)
map <silent> <c-j> <Plug>(leap-in-win-lower)
map <silent> <c-k> <Plug>(leap-in-win-higher)
map <silent> <c-l> <Plug>(shift-to-middle)

""" Pane
" leap between panes
nnoremap <a-h> <c-w>h
nnoremap <a-j> <c-w>j
nnoremap <a-k> <c-w>k
nnoremap <a-l> <c-w>l

"nnoremap <a-b> <c-w>b
"nnoremap <a-t> <c-w>t
" avoid stack on command-line
cnoremap <a-k> <ESC>

""" Tab Page
"" Move between Tabs
nnoremap <c-n> gT
nnoremap <c-p> gt
"nnoremap <silent> <a-t><a-o> :tabonly<cr>
"" Give Tab
"nnoremap <a-t><c-g> <c-w>T

""" Go-To
"" Help
"noremap <silent> gh :h <c-r>=<cWORD><cr>

"" Man
"noremap <silent> gm :Man <c-r>=<cWORD><CR>

"" File-Path
" switch mapping
noremap gf gF
noremap gF gf
"noremap gd gD
"noremap gD gd

""” Research
"" TODO: setlocal show result w/ no-file path but only file name.
"" Grep to QuickFix  # no dirty-hist # Good enough with fzf.vim.
"nnoremap <space>/ :silent vimgrep  % <bar> cw<Left,<Left,<Left,<Left><Left><Left><Left>

"" Dot-Repeat
nnoremap <a-n> .n
nnoremap <a-;> .;
nnoremap <a-,> .,
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
"""" GENERAL
if has('nvim')
  """" KEYMAP
  """ Normal Mode
  "" Open Shortcut
  nnoremap <silent> <a-t><a-h> :<c-u>cd ~           <bar>:te<cr>
  nnoremap <silent> <a-t><a-o> :<c-u>cd ~/org       <bar>:te<cr>
  nnoremap <silent> <a-t><a-.> :<c-u>cd ~/dotfiles  <bar>:te<cr>
  nnoremap <silent> <a-t><a-d> :<c-u>cd ~/dotfiles  <bar>:te<cr>
  nnoremap <silent> <a-t><a-g> :<c-u>cd ~/.config   <bar>:te<cr>
  nnoremap <silent> <a-t><a-w> :<c-u>cd %:p:h       <bar>:te<cr>
  nnoremap <silent> <a-t>h :<c-u>cd ~          <bar>:te<cr>
  nnoremap <silent> <a-t>o :<c-u>cd ~/org      <bar>:te<cr>
  nnoremap <silent> <a-t>. :<c-u>cd ~/dotfiles <bar>:te<cr>
  nnoremap <silent> <a-t>d :<c-u>cd ~/dotfiles <bar>:te<cr>
  nnoremap <silent> <a-t>g :<c-u>cd ~/.config  <bar>:te<cr>
  nnoremap <silent> <a-t>w :<c-u>cd %:p:h      <bar>:te<cr>

  nnoremap <silent> <a-t>e :<c-u>         :te<cr>
  nnoremap <silent> <a-t>s :<c-u>sp  <bar>:te<cr>
  nnoremap <silent> <a-t>v :<c-u>vs  <bar>:te<cr>
  nnoremap <silent> <a-t>t :<c-u>tabe<bar>:te<cr>
  nnoremap <silent> <a-t><a-e> :<c-u>         :te<cr>
  nnoremap <silent> <a-t><a-s> :<c-u>sp  <bar>:te<cr>
  nnoremap <silent> <a-t><a-v> :<c-u>vs  <bar>:te<cr>
  nnoremap <silent> <a-t><a-t> :<c-u>tabe<bar>:te<cr>

  " Jump Anyway by <c-i><c-o>
  "tmap <c-i> <c-\><c-n><c-i>
  tmap <c-o> <c-\><c-n><c-o>
  tmap <a-i> <c-\><c-n><a-i>
  tmap <a-o> <c-\><c-n><a-o>
  tmap <a-p> <c-\><c-n><a-p>
  tmap <a-n> <c-\><c-n><a-n>

  "" Alt as ESC as in Insert Mode
  " esc & hjkl
  " <a-b> is useful on bash
  tnoremap <a-h> <c-\><c-n>h
  tnoremap <a-j> <c-\><c-n>j
  tnoremap <a-k> <c-\><c-n>k
  tnoremap <a-l> <c-\><c-n>l
  "tnoremap <a-h> <c-\><c-n><c-w>h
  "tnoremap <a-j> <c-\><c-n><c-w>j
  "tnoremap <a-k> <c-\><c-n><c-w>k
  "tnoremap <a-l> <c-\><c-n><c-w>l
endif

""" Buffer
" <c-[> to <esc>, <c-]> for tag-jump.
noremap <silent> <a-i> :bnext<cr>
noremap <silent> <a-o> :bprevious<cr>
noremap <c-6> <c-^>

"" QuickFix
noremap <silent> <space>co :copen<cr>
noremap <silent> <space>cw :cwindow<cr>
noremap <silent> <space>cc :cclose<cr>:lclose<cr>
