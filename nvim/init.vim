runtime! dein.vim
runtime! config.d/*.vimrc

" even when default is 'on' on NeoVim,
" set options to share environment in vi & vim as much as possible.

"" Encoding
""set enc=utf-8
" when different from utf-8, convert it.
set fenc=utf-8
""set formatoptions=tcqj
" for multi-byte code
scriptencoding utf-8
set ambiwidth=double

"" GUI
set number " show line number on left
"if has('nvim')
"  augroup noNumOnTermMode
"    au!
"    au TermOpen * set nonumber 
"    au TermClose * set number
"  augroup END
"endif

" show match parens.
set showmatch
" add '<' and '>' as a match pair
set matchpairs& matchpairs+=<:>
" wrap long text.
set wrap
" show space and CR
set list
"" eol: 改行
"" extends: when window-width omits on right end.
"" precedes: when window-width omits on left.
"" nbsp: for space
"set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%

set colorcolumn=81
"augroup CursorlineOnlyOnActiveWindow
"  au!
"  au VimEnter,BufWinEnter,WinEnter * setlocal cursorline
"  au WinLeave * setlocal nocursorline
"augroup END

"" Multiple Windows
set splitbelow
set splitright

"" Speed
set matchtime=1  " 対応括弧を1秒間表示
""set ttyfast

"" Backup
set nobackup
set nowritebackup
set noswapfile
set hidden

"" Statusbar
set title
" show coordinate; some plugins does instead more beautifully.
"set ruler
""" always show the current status.
""set laststatus=2

"" Search
set noignorecase
set smartcase " strictly sense case with upper case.
set noincsearch " 順次検索しない
""set hlsearch
set nowrapscan
set nofoldenable " マッチした行以外を畳む

"""" Mode
" IME will be off, when lmap is off.
" lmap supports 3 modes: Insert, Commandline and Lang-Arg.
set iminsert=0
"" Tab Char
augroup SolveTabComplex
  au!
  " replace all tab-chars with tab-settings on vimrcs.
  " if replace spaces, too, ':retab!'.
  au BufReadPre * retab
augroup END

"" Insert Tab
" insert spaces, instead of a tab-char.
set expandtab
" number of spaces, inserted by tab-key, that a tab-char counts for.
set tabstop=2
" number of spaces, inserted by tab-key, next to tab-chars.
set softtabstop=2

""" Insert Indent
" copy indent dependent on first char of current line.
set autoindent
" copy indent dependent on last char of current line.
set smartindent
" indent setting for c-lang.
set cindent

" number of spaces inserted by autoindent.
set shiftwidth=2
" for manual indent, insert spaces according to shiftwidth.
set smarttab
" for '<' & '>' indent, insert spaces according to shiftwidth.
set shiftround
" specific indent setting for Javascript
au! FileType Javascript setlocal shiftwidth=4 tabstop=4 softtabstop=4

"" Visual Mode
" visualize even if there is no chars.
set virtualedit=block

"" Commandline Mode
set noshowcmd
" activate completion on command-line
set wildmenu
set wildmode=list:longest
"set history=10000
