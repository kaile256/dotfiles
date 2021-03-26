" From: init.vim

" The format seems incompatible between Vim and Neovim.
let s:data_home = $XDG_DATA_HOME . ( has('nvim') ? 'nvim' : 'vim' )

"augroup PersistentUndo
"  au! BufWritePre /tmp/* setlocal noundofile
"augroup END

exe 'set undofile undodir='. s:data_home .'/undo'
exe 'set swapfile directory='. s:data_home .'/swap//'
exe 'set writebackup backupdir='. s:data_home .'/backup//'
set backupskip=*/tmp/*,*/.git/*
"set backupcopy=
"set backupext=
"exe 'set viminfo=''1000,n'. s:data_home .'/info'

"augroup NoSimultaniusSwap
"  au! SwapExists * let v:swapchoice = 'd'
"augroup END

unlet s:data_home
