" From: init.vim

set nobackup
set nowritebackup
set noswapfile
"augroup PersistentUndo
"  au! BufWritePre /tmp/* setlocal noundofile
"augroup END

set undofile undodir=~/.local/share/nvim/undo
"set swapfile directory=~/.local/share/nvim/swap//
"set backup writebackup backupdir=~/.local/share/nvim/backup
"set backupskip+=
"set backupcopy=
"set backupext=
"set viminfo='1000,n~/.local/share/nvim/info

"augroup NoSimultaniusSwap
"  au! SwapExists * let v:swapchoice = 'd'
"augroup END
