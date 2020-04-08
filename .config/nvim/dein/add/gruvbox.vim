" From: Init.toml
" Repo: morhetz/gruvbox
" Repo: flazz/vim-colorschemes
" Another: source/gruvbox.vim

augroup myGruvboxAdd
  if exists('#myGruvboxAdd') | au! myGruvboxAdd
  endif
  au VimEnter * ++nested colorscheme gruvbox
augroup END
