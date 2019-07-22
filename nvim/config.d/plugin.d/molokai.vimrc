" the common settings
set t_Co=256
set termguicolors
"set bg=light

" when molokai theme

let g:rehash256 = 1
" make highlight clear on molokai.
augroup myMolokai
  au!
  au VimEnter,BufReadPost * colorscheme molokai
  au VimEnter,BufReadPost * hi Search               ctermbg=155
  au VimEnter,BufReadPost * hi Comment ctermfg=245
  au VimEnter,BufReadPost * hi Number  ctermfg=245
  au VimEnter,BufReadPost * hi Visual               ctermbg=227
augroup END

"" when solarized theme
"let g:solarized_termcolors=256
"colo solarized
