" TOML: operator.toml
" Repo: AndrewRadev/switch.vim
" Another: add/switch.vim

"let g:switch_find_smallest_match = 0

" override to suppress default one
let g:switch_mapping = ''
" let g:switch_reverse_mapping = ''

" \<foo\> doesn't work well; return '<foo>'(with '<>') when '\<foo\>'
" it doesn't seem to expect regexp
" let g:switch_custom_definitions = [ ]

augroup mySwitchAdd
  if exists('#mySwitchAdd') | au! mySwitchAdd
  endif
  au FileType * if has_key(s:definitions, &ft) |
        \ let b:switch_custom_definitions = s:definitions[&ft]
        \ | endif
augroup END

let g:switch_custom_definitions = [
      \ ['==', '!='],
      \ [0, 'null'],
      \
      \ ['first', 'second', 'third'],
      \
      \ ['L', 'R'],
      \ ['left', 'right'],
      \ ['H', 'W'],
      \ ['height', 'width'],
      \
      \ ['next', 'prev'],
      \ ['lower', 'upper'],
      \ ]

let s:definitions = {}

let s:definitions['gitrebase'] = [
      \ ['pick', 'squash'],
      \ ]

let s:definitions['vim'] = [
      \ ['==', '!='],
      \ ['\zs', '\ze'],
      \
      \ ['nmap', 'xmap'],
      \ ['imap', 'cmap', 'tmap'],
      \
      \ ['nnoremap', 'xnoremap'],
      \ ['inoremap', 'cnoremap', 'tnoremap'],
      \
      \ ['<silent>', '<script>'],
      \ ]

let s:definitions['php'] = [
      \ ['submit', 'text', 'radio'],
      \ ]

let s:definitions['java'] = [
      \ ['private', 'protected', 'public']
      \ ]

let s:definitions['markdown'] = [
      \ ['first', 'second', 'third']
      \ ]
