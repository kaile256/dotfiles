"""" From: Initial.toml
""""  Ref: molokai.vimrc

set t_Co=256
set termguicolors

"set bg=light
let g:solarized_termcolors=256
colo solarized

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
