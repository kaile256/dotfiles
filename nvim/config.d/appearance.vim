"""" From: nvim/init.vim

"""" ColorScheme
""" Ref: dein.vim

"""" Read Only
"augroup AlertWhenReadOnly
"  au! BufReadPost,BufEnter *
"  if &readonly && &buftype !=# 'help' && &buftype !=# directory
"    colorscheme morning
"  endif
"augroup END

""" Color
set termguicolors

""" Column
" show line number on left
set number
" wrap long text.
set wrap
set colorcolumn=81
if has('terminal')
  augroup NoNumberOnTermMode
    au! TermOpen * setlocal nonumber
  augroup END
endif

""" Line
"" Ref molokai.vimrc
"" Ref solarized.vimrc

""" Statusbar
set title
set ruler
" 2: always show the current status.
set laststatus=2

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
