" write in *.vimrc for the config dependent on plugins.
runtime! config.d/*.vim
runtime! config.d/stdmap.d/*.vimap

"" Backup
set nobackup
set nowritebackup
set noswapfile
set hidden
set undofile undodir=~/.cache/nvim/backup/undo.vim

"" Search
set noignorecase
" sensitive to case only with upper case.
"set smartcase 
set incsearch
set hlsearch
set nowrapscan
set nofoldenable " マッチした行以外を畳む

"" Insert Tab-Char
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

"" Visual Mode
" visualize even if there is no chars.
set virtualedit=block

"" Commandline Mode
set noshowcmd
" activate completion on command-line
set wildmenu
set wildmode=list:longest
"set history=10000
"set wildoptions=pum
"set pumblend=20
