"""" From: 'init.vim'

""" Column
" show line number on left
set number
" wrap long text.
set wrap
set colorcolumn=81

"""" Read Only
augroup AlertWhenReadOnly
  if &readonly && &buftype !=# qf
    au BufReadPost,BufEnter,WinEnter * colorscheme morning
  endif
augroup END

"augroup CursorlineOnlyOnActiveWindow
"  au!
"  au VimEnter,BufWinEnter,WinEnter * setlocal cursorline
"  au WinLeave * setlocal nocursorline
"augroup END

""" Pair
" show match parens.
set showmatch
" add '<' and '>' as a match pair
set matchpairs+=<:>

"" Invisible Charactars
" show space and CR
set list
"" eol: <CR>
"" extends: when window-width omits on right end.
"" precedes: when window-width omits on left.
"" nbsp: for space
"set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%

"" Multiple Windows
set splitbelow
set splitright

"" Speed
set matchtime=1  " 対応括弧を1秒間表示
""set ttyfast

"" Statusbar
set title
set ruler
" 2: always show the current status.
set laststatus=2
