" From: appearance.toml

set noshowmode
set noruler

let g:airline_theme = 'term'

"let g:airline_powerline_fonts = 1

let g:airline_detect_iminsert = 1

" airline#extemsions
let g:airline#extensions#nrrwrgn#enabled = 1
let g:airline#extensions#coc#enabled = 1
let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

"let g:airline_mode_map = {
"    \ '__' : '-',
"    \ 'n'  : 'N',
"    \ 'i'  : 'I',
"    \ 'R'  : 'R',
"    \ 'c'  : 'C',
"    \ 'v'  : 'V',
"    \ 'V'  : 'V',
"    \ ''   : 'V',
"    \ 's'  : 'S',
"    \ 'S'  : 'S',
"    \ }
