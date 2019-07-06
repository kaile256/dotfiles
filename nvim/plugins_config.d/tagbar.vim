" 0: sort in order of source file
" 1: sort by name (default)
let g:tagbar_sort = 0

"  0: do not show any (default)
"  1: show absolute line numbers.
"  2: show relative line numbers.
" -1: use the global line number settings.
let g:tagbar_show_linenumbers = 1

" ['▶', '▼'] is default. 
let g:tagbar_iconchars = ['+', '-']

" 0: open folds only when the current tag is inside a closed fold. (default)
" 1: open folds as much as needed for the tag to be visible.
" 2: never open folds automatically.
let g:tagbar_autoshowtag = 1

"augroup myTag
"  au!
"  " automatically open TagBar
"  au FileType vim nested :call tagbar#autoopen(1)
"augroup END
