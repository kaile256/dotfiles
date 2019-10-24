" From: finder.toml
" Repo: majutsushi/tagbar

let g:tagbar_iconchars = ['*', '#']

let g:tagbar_silent = 1

" 0: open folds only when the current tag is inside a closed fold. (default)
" 1: open folds as much as needed for the tag to be visible.
" 2: never open folds automatically.
let g:tagbar_autoshowtag = 1
let g:tagbar_autofocus = 1


" 0: sort in order of source file
" 1: sort by name (default)
let g:tagbar_sort = 0

let g:tagbar_compact = 0 " show help introduction

let g:tagbar_indent = 1
let g:tagbar_foldlevel = 2

"let g:tagbar_show_linenumbers = 0
"let g:tagbar_vertical = 0
let g:tagbar_width = 30

nnoremap <silent> <a-i> :<c-u>TagbarToggle<CR>
