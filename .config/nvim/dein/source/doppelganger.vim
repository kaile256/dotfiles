" TOML: myplug.toml
" Repo: kaile256/vim-doppelganger

" let g:doppelganger#prefix = '▸ '

let g:doppelganger#ego#max_offset = 5

augroup myDoppelgangerSo
  if exists('#myDoppelgangerSo') | au! myDoppelgangerSo
  endif
  au Colorscheme * ++nested :hi! DoppelgangerVirtualText ctermfg=97 guifg=#875faf cterm=italic gui=italic
augroup END
