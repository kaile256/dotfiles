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

" Excerpt: Regexp support in Dictionary, {'if_matched': 'then_this_one'}, e.g.,
" let b:switch_custom_definitions = [{
"     \ '<div\(.\{-}\)>\(.\{-}\)</div>':   '<span\1>\2</span>',
"     \ '<span\(.\{-}\)>\(.\{-}\)</span>': '<div\1>\2</div>',
"     \ }]

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
