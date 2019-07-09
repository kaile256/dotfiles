runtime! dein.vim
runtime! config.d/*.vimrc

""" Double-doublequotes Comment Out settings means satisfying by default.
""" When make a setting off, set no**.

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
"" Insert Tab
" insert space instead of tab char.
set expandtab
set tabstop=2  " 表示されるtab文字幅
set softtabstop=2  " 空白文字の右に入力するtab文字幅

""" Insert Indent
""set autoindent
set nosmartindent
set shiftwidth=2  " 自動インデントの幅
au! FileType Javascript \
  setlocal shiftwidth=4 tabstop=4 softtabstop=4
""set smarttab  " 行頭余白でtabを打つと'shiftwidth'で指定した数だけindentする
set shiftround  " indentをshiftwidthの倍数に丸める

"" Visual Mode
set virtualedit=block " 矩形選択で、文字がなくても右へ進める

"" Commandline Mode
set noshowcmd
""set wildmenu
" let completion on command-line
set wildmode=list:longest
"set history=10000

"""" Netrw
" where .netrwhist is located.
let g:netrw_home = "$XDG_CACHE_HOME/nvim/netrw"
" 0:show all, including hidden files.
let g:netrw_hide = 0
" 'H':show bytes like 5K, 4M, 3G
let g:netrw_sizestyle ='H'
" 'v' opens on right.
let g:netrw_altv = 1
" 'o' opens on below.
let g:netrw_alto = 1
"let g:netrw_liststyle = 2 " always show tree view at first.
