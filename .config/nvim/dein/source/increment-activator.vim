" TOML: operator.toml
" Repo: nishigori/increment-activator
" Another: source/increment-activator.vim

let g:increment_activator_filetype_candidates = {}

let g:increment_activator_filetype_candidates['_'] = [
      \ [0, 'null'],
      \ ['first', 'second', 'third'],
      \
      \ ['L', 'R'],
      \ ['left', 'right'],
      \
      \ ['H', 'W'],
      \ ['height', 'width'],
      \
      \ ['next', 'prev'],
      \ ]

let g:increment_activator_filetype_candidates['java'] = [
      \ ['private', 'protected', 'public'],
      \ ]

let g:increment_activator_filetype_candidates['vim'] = [
      \ ['noremap',  'nnoremap', 'xnoremap'],
      \ ['inoremap', 'cnoremap', 'tnoremap'],
      \ ['<silent>', '<script>'],
      \ ['==', '!='],
      \ ]
