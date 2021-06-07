" From: init.vim

" The format seems incompatible between Vim and Neovim.
let s:data_home = $XDG_DATA_HOME .'/'. ( has('nvim') ? 'nvim' : 'vim' )

"augroup PersistentUndo
"  au! BufWritePre /tmp/* setlocal noundofile
"augroup END

setglobal noswapfile
augroup myBackupfiles-ToggleSwapfile
  function! s:remove_swapfile() abort
    if !&swapfile || &modified | return | endif
    " Turn off &swapfile also remove the existing swapfile.
    setlocal noswapfile
  endfunction
  au BufWritePost * call s:remove_swapfile()
  au TextChanged,TextChangedI,TextChangedP * setlocal swapfile
augroup END

exe 'set undofile undodir='. s:data_home .'/undo/'
exe 'set directory='. s:data_home .'/swap//'
exe 'set writebackup backupdir='. s:data_home .'/backup//'
set backupskip=*/tmp/*,*/.git/*
"set backupcopy=
"set backupext=
"exe 'set viminfo=''1000,n'. s:data_home .'/info'

exe 'set spellfile='. s:data_home .'/spell/en.utf-8.add'

augroup myRc/Backupfiles-NoOldfiles
  exe 'au BufWinEnter' &undodir .'* setlocal bufhidden=wipe nobuflisted'
augroup END

function! s:mk_backup_locations_if_unexisted() abort
  const locations = [
        \ &undodir,
        \ &directory,
        \ &backupdir,
        \ &spellfile,
        \ ]
  for loc in locations
    if loc =~# '/$'
      if isdirectory(loc) | continue | endif
      const type = 'directory'
    else
      if filewritable(loc) | continue | endif
      const type = 'file'
    endif

    let confirm = input('backupfiles: create a new '. type .' "'. loc .'"? [Y]es/[n]o')
    if confirm !~? 'y\%[es]'
      echo "\nabort"
      continue
    endif
    if type ==# 'directory'
      call mkdir(loc, 'p')
    else
      call system('touch '. loc)
    endif
    echo "\ncreated" loc
  endfor
endfunction
call s:mk_backup_locations_if_unexisted()
delfunction s:mk_backup_locations_if_unexisted

unlet s:data_home
