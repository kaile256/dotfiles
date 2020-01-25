" From: Init.toml
"  Ref: solarized.vimrc

" the common settings
let g:rehash256 = 1

augroup MyColoAugroup
  au!
  au VimEnter * nested colorscheme molokai
augroup END

" make highlight clear on molokai.
"colorscheme molokai
"augroup MyMolokai
"  au VimEnter * nested colorscheme molokai
"  au VimEnter * nested hi Search               ctermbg=155
"  au VimEnter * nested hi Comment ctermfg=245
"  au VimEnter * nested hi Number  ctermfg=245
"  au VimEnter * nested hi Visual               ctermbg=227
"augroup END
