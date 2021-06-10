finish

" TODO: Make it work: f-pattern require'foo'
if !dein#tap('vim-sandwich') | finish | endif

let b:sandwich_magicchar_f_patterns =
      \ deepcopy(get(g:, 'sandwich#magicchar#f#patterns', []))

let b:sandwich_magicchar_f_patterns += [
     \ {
     \  'header': '\<\%(\h\k*\.\)*\h\k*',
     \  'bra': '"',
     \  'ket': '"',
     \  'footer': '',
     \ },
     \ {
     \  'header': '\<\%(\h\k*\.\)*\h\k*',
     \  'bra': "'",
     \  'ket': "'",
     \  'footer': '',
     \ },
     \ ]
