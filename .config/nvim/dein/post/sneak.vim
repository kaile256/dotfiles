" From: motion.toml
" Repo: justinmk/vim-sneak
" Fork: kaile256/vim-sneak
" Ref: add/easymotion.vim
" Another: add/sneak.vim

if g:colors_name ==# 'neodark'
  hi! Sneak ctermfg=magenta guifg=#ed53cd ctermbg=NONE guibg=NONE cterm=bold gui=bold
else
  hi! Sneak ctermfg=magenta guifg=#82009c ctermbg=white guibg=#ffa44b cterm=bold gui=bold
endif
" highlight for sneak-vertical-scope
hi! SneakScope cterm=reverse gui=reverse
" highlight for sneak-label-mode
hi! SneakLabel cterm=bold,reverse gui=bold,reverse
      \ ctermfg=208 ctermbg=236
      \ guifg=#fe8019 guibg=#303030
hi! SneakCursor cterm=reverse gui=reverse ctermfg=green  guifg=#3de476

augroup mySneakPost
  " keep cursor while waiting input
  au User SneakEnter let s:cursor = matchadd('SneakCursor', '\%#')
  au User SneakLeave call matchdelete(s:cursor)
  au User SneakEnter call eskk#disable()
augroup END
