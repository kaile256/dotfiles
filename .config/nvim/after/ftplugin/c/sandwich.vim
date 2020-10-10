" From: operator.toml
" Repo: machakann/vim-sandwich

if !dein#tap('vim-sandwich') | finish | endif

let b:sandwich_magicchar_f_patterns =
      \ get(g:, 'sandwich_magicchar_f_patterns', [])

let b:sandwich_magicchar_f_patterns += [{
      \ 'header' : '\<\%(\h\k*:\)*\h\k*',
      \ 'bra'    : '<',
      \ 'ket'    : '>',
      \ 'footer' : '',
      \ }]
