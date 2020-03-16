" From: debug.toml
" Repo: janko/vim-test

let g:test#neovim#term_position = 'vert botright 30'

" disable clearing the screen for strategies
"let g:test#preserve_screen = 1

" to show results in quickfix, set it from make, make_bang, neomake, makegreen,
" dispatch or dispatch_background
"
" strategies can be set per granularity:
"   let g:test#strategy = {
"         \ 'nearest': 'neovim',
"         \ 'file':    'dispatch',
"         \ 'suite':   'basic',
"         \ }
" or per command:
"  :TestFile -strategy=neovim
let g:test#strategy = 'neomake'
