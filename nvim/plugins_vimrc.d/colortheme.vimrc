" the common settings
set t_Co=256
set termguicolors
"set bg=light

" when molokai theme
colorscheme molokai
let g:rehash256 = 1
" make highlight clear on molokai.
augroup ModifyColo
  au!
  au CursorMoved * hi Search              ctermbg=155
  au VimEnter    * hi Comment ctermfg=245
augroup END

"" when solarized theme
"let g:solarized_termcolors=256
"colo solarized
