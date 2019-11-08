" From: init.vim

set nobackup
set nowritebackup
set noswapfile
"augroup PersistentUndo
"  au! BufWritePre /tmp/* setlocal noundofile
"augroup END

set undofile undodir=~/.local/share/nvim/undo
"set swapfile directory=~/.local/share/nvim/swap
"set backup writebackup backupdir=~/.local/share/nvim/backup
"set viminfo='1000,n~/.local/share/nvim/info
"set runtimepath=$XDG_CONFIG_HOME/vim,http://eleclog.quitsq.com/2014/10/arch-on-x220.html?m=1$VIMRUNTIME,$XDG_CONFIG_HOME/vim/after

"augroup NoSimultaniusSwap
"  au! SwapExists * let v:swapchoice = 'd'
"augroup END
