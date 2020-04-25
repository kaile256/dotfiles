" From: motion.toml
" Repo: justinmk/vim-sneak
" Fork: kaile256/vim-sneak
" Ref: add/easymotion.vim
" Another: add/sneak.vim

hi! Sneak cterm=bold gui=bold ctermfg=magenta  guifg=#ed53cd
" highlight for sneak-vertical-scope
hi! SneakScope cterm=reverse gui=reverse
" highlight for sneak-label-mode
hi! SneakLabel cterm=bold,reverse gui=bold,reverse
      \ ctermfg=208 ctermbg=236
      \ guifg=#fe8019 guibg=#303030
hi! SneakCursor cterm=reverse gui=reverse ctermfg=green  guifg=#3de476

augroup mySneakPost
  if exists('#mySneakPost') | au! mySneakPost
  endif
  " keep cursor while waiting input
  au User SneakEnter let s:cursor = matchadd('SneakCursor', '\%#')
  au User SneakLeave call matchdelete(s:cursor)
  au User SneakEnter call eskk#disable()
augroup END
