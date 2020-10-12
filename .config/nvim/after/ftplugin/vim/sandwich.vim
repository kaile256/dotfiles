" From: operator.toml
" Repo: machakann/vim-sandwich
" Fork: kaile256/vim-sandwich

if !dein#tap('vim-sandwich') | finish | endif

let b:sandwich_magicchar_f_patterns =
      \ get(g:, 'sandwich#magicchar#f#patterns', [])

let b:sandwich_magicchar_f_patterns += [{
      \ 'header' : '\<\%(\h\k*:\)*\h\k*',
      \ 'bra'    : '(',
      \ 'ket'    : ')',
      \ 'footer' : '',
      \ }]
