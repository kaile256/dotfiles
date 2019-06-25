runtime! keymap.d/*.vimrc
runtime! dein.vimrc

"" Config Coding
set enc=utf-8
scriptencoding utf-8
set ambiwidth=double

"" Config GUI
set number " show line number on left
augroup noNumOnTermMode
  au!
  au TermOpen * set nonumber 
  au TermClose * set number
augroup END

set showmatch  " 対応括弧の強調
set cursorline  " 重ければ削除
set wrap " wrap long text.
set list  " 空白と改行を可視化
set colorcolumn=81

"" Config Multiple Windows
set splitbelow
set splitright

"" Config Runtimes
set matchtime=1  " 対応括弧を1秒間表示

"" Config Backup
set nobackup
set nowritebackup
set noswapfile
set hidden

"" Config Statusbar
set title
set ruler  " 座標表示
set laststatus=2 " always shows the current status.
set wildmenu wildmode=list:longest

"" Config Search
set ignorecase
set smartcase " strictly sense case with upper case.
set noincsearch  " 順次検索しない
set hlsearch
set nowrapscan
set nofoldenable " マッチした行以外を畳む

"""" Config Mode
"" Insert Tab
" insert space instead of tab char.
set expandtab
set softtabstop=2  " 空白文字の右に入力するtab文字幅
set tabstop=2  " 表示されるtab文字幅

"" Insert Indent
set shiftwidth=2  " 自動インデントの幅
set smarttab  " 行頭余白でtabを打つと'shiftwidth'で指定した数だけindentする
set shiftround  " indentをshiftwidthの倍数に丸める

"" Visual Mode
set virtualedit=block " 矩形選択で、文字がなくても右へ進める

"" Commandline Mode
set noshowcmd
set history=10000  " コマンドライン履歴を確保 

"" Config Netrw
let g:netrw_altv = 1 " 'v' opens on right.
let g:netrw_alto = 1 " 'o' opens on below.  
" let g:netrw_liststyle = 2 " always show tree view at first.

if has('nvim')
  endif
