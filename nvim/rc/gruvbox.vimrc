" From: Init.toml
" From: dein.vimrc

let g:gruvbox_contrast_dark = 'hard'

augroup MyColoAugroup
  au!
  au VimEnter * nested colorscheme gruvbox
augroup END
