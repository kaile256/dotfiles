" TOML: appearance.toml
" Repo: junegunn/limelight.vim
" Another: source/limelight.vim
" Another: post/limelight.vim

" Note:
" Bang to disable; ':Limelight!!' to toggle.
" <Plug>(Limelight) is operator mapping.

" Mnemonic: improve Visibility
nnoremap <silent> <space>v :<C-u>Limelight!!<CR>
" nmap \v <Plug>(Limelight)
" xmap \v <Plug>(Limelight)

augroup myLimelightAdd-autoToggle
  au!
  " au BufEnter *.gz if &ft =~# 'man' && &readonly | Limelight  | endif
  " au BufLeave *.gz if &ft =~# 'man' && &readonly | Limelight! | endif

  " au BufEnter *.txt if &ft =~# 'help' && &readonly | Limelight  | endif
  " au BufLeave *.txt if &ft =~# 'help' && &readonly | Limelight! | endif

  au BufEnter *.git/index :Limelight
  au BufLeave *.git/index :Limelight!
augroup END
