" From: motion.toml
" Repo: justinmk/vim-sneak
" Fork: kaile256/vim-sneak
" Ref: add/easymotion.vim
" Another: add/sneak.vim

hi! Sneak cterm=bold gui=bold ctermfg=magenta  guifg=#ed53cd
hi! SneakScope cterm=reverse gui=reverse
hi! SneakLabel cterm=bold,reverse gui=bold,reverse
      \ ctermfg=208 ctermbg=236
      \ guifg=#fe8019 guibg=#303030

augroup mySneakPost
  if exists('#mySneakPost') | au! mySneakPost
  endif
  " keep cursor while waiting input
  au User SneakEnter let s:cursor = matchadd('DiffAdd', '\%#')
  au User SneakLeave call matchdelete(s:cursor)
augroup END
