"""" From: nvim/init.vim

"""" ColorScheme
""" Ref: dein.vim

"""" transparency on FocusLost
"augroup TransparencyOnFocusLost
"  au!
"  au FocusLost * set transparency=
"augroup END

"" Redraw
" CAUTION: <c-l> should be run at LAST so that no corruption.
" CAUTION: zR (open all fold) makes vim FREEZE.
"" Ref: showmarks.vimrc
imap <silent> <c-l> <c-o> :<c-u> noh <bar> redraw <cr>
nmap <silent> <space><space>     :<c-u>noh <bar> redraw <cr>
" <a-space> gets along with <a-hjkl>.
nmap <silent> <a-space><a-space> :cclose <bar> lclose <bar> retab <cr>
nmap <silent> <a-space>space     :cclose <bar> lclose <bar> retab <cr>

"""" Read Only
augroup AlertWhenReadOnly
  au! BufReadPost,BufEnter *
  if &readonly && &filetype !=# 'help' && &buftype !=# 'directory'
    colorscheme morning
  endif
augroup END

""" Color
set termguicolors

""" Column
" show line number on left
set number
" wrap long text.
set wrap
set colorcolumn=81

""" Line
" CAUTION: cursorline-highlight causes drawing corruption.
augroup CursorLine
  au! BufRead,WinEnter,InsertLeave * silent setlocal cursorline
  au! WinLeave,InsertEnter * silent setlocal nocursorline
augroup END
" highlight only CursorLineNr
"hi CursorLine NONE

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
