"" Collect Config for Appearance

""" Column
" show line number on left
set number
" wrap long text.
set wrap
set colorcolumn=81

""" Pair
" show match parens.
set showmatch
" add '<' and '>' as a match pair
set matchpairs+=<:>

"" Invisible Charactars
" show space and CR
set list
"" eol: 改行
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
" show coordinate; some plugins does instead more beautifully.
"set ruler
""" always show the current status.
""set laststatus=2
