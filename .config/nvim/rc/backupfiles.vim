" From: init.vim

" The format seems incompatible between Vim and Neovim.
let s:data_home = $XDG_DATA_HOME .'/'. ( has('nvim') ? 'nvim' : 'vim' )

"augroup PersistentUndo
"  au! BufWritePre /tmp/* setlocal noundofile
"augroup END

augroup myBackupfiles-ToggleSwapfile
  function! s:remove_swapfile() abort
    if !&swapfile || &modified | return | endif
    " Turn off &swapfile also remove the existing swapfile.
    set noswapfile
  endfunction
  au BufWritePost * call s:remove_swapfile()
  au TextChanged,TextChangedI,TextChangedP * set swapfile
augroup END

exe 'set undofile undodir='. s:data_home .'/undo'
exe 'set directory='. s:data_home .'/swap//'
exe 'set writebackup backupdir='. s:data_home .'/backup//'
set backupskip=*/tmp/*,*/.git/*
"set backupcopy=
"set backupext=
"exe 'set viminfo=''1000,n'. s:data_home .'/info'

function! s:mk_backupdirs_if_unexisted() abort
  const dirs = [
        \ &undodir,
        \ &directory,
        \ &backupdir,
        \ ]
  for dir in dirs
    if isdirectory(dir) | continue | endif
    let confirm = input('backupfiles: create "'. dir .'"? [Y]es/[n]o')
    if confirm !~? 'y\%[es]'
      echo 'abort'
      continue
    endif
    call mkdir(dir, 'p')
  endfor
endfunction
call s:mk_backupdirs_if_unexisted()
delfunction s:mk_backupdirs_if_unexisted

unlet s:data_home
