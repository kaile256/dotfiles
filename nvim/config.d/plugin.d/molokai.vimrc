"""" From: Initial.toml
""""  Ref: solarized.vimrc

" the common settings
set t_Co=256
set termguicolors

let g:rehash256 = 1

" make highlight clear on molokai.
colorscheme molokai
hi Search               ctermbg=155
hi Comment ctermfg=245
hi Number  ctermfg=245
hi Visual               ctermbg=227

" CAUTION: cursorline-highlight causes drawing corruption.
set cursorline
" highlight only CursorLineNr
hi CursorLine NONE

"augroup CursorlineOnlyOnActiveWindow
"  au!
"  au VimEnter,BufWinEnter,WinEnter * setlocal cursorline
"  au WinLeave * setlocal nocursorline
"  " highlight only column-number.
"  hi clear CursorLine
"augroup END
