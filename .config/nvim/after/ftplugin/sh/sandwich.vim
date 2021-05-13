if !dein#tap('vim-sandwich') | finish | endif

let b:sandwich_magicchar_f_patterns =
      \ deepcopy(get(g:, 'sandwich#magicchar#f#patterns', []))

let b:sandwich_magicchar_f_patterns += [{
      \ 'header' : '\$',
      \ 'bra'    : '{',
      \ 'ket'    : '}',
      \ 'footer' : '',
      \ }]

