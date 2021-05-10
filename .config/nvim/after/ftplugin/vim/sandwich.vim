" From: operator.toml
" Repo: machakann/vim-sandwich
" Fork: kaile256/vim-sandwich

if !dein#tap('vim-sandwich') | finish | endif

let b:sandwich_magicchar_f_patterns =
      \ deepcopy(get(g:, 'sandwich#magicchar#f#patterns', []))

let b:sandwich_magicchar_f_patterns += [{
      \ 'header' : '\<\%(\|[gtwbsl]:\)*\h\k*\|\c<\(sid\|plug\)>',
      \ 'bra'    : '(',
      \ 'ket'    : ')',
      \ 'footer' : '',
      \ }]
