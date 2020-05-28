" From: appearance.toml
" Repo: vim-airline/vim-airline

let g:airline_theme = 'base16_vim'

" let g:airline_powerline_fonts = 1
let g:airline_detect_iminsert = 1
let g:airline_highlighting_cache = 1

let g:airline#parts#ffenc#skip_expected_string = 'utf-8[unix]'

let g:airline#extensions#branch#empty_message = '...'
let g:airline#extensions#branch#format = 2

" let g:airline#extensions#hunks#non_zero_only = 1

let g:airline#extensions#whitespace#enabled = 0

"let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
"let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'

let g:airline#extensions#bufferline#enabled = 0

" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#fnametruncate = 1
" let g:airline#extensions#tabline#buffer_nr_show = 1
"
"let g:airline#extensions#tabline#show_buffers = 0
"let g:airline#extensions#tabline#show_tab_count = 0
"
"let g:airline#extensions#tabline#formatter = 'unique_tail'
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'

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

augroup myAirlineSo "{{{1
  if exists('#myAirlineSo') | au! myAirlineSo
  endif
  au ColorScheme * ++nested call s:set_airline_theme("<amatch>")
augroup END
function! s:set_airline_theme(coloname) abort
  let themes = airline#util#themes(a:coloname)

  if empty(themes)
    let theme = g:airline_theme
  else
    let theme = themes[0]
  endif

  exe 'AirlineTheme' theme
endfunction
