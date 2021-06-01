if !dein#tap('vim-sandwich') | finish | endif

let b:sandwich_magicchar_f_patterns = [
      \ {
      \   'header': '\h\k*',
      \   'bra': '$(',
      \   'ket': ')',
      \   'footer': '',
      \   'lisp': 1,
      \ },
      \ ]
