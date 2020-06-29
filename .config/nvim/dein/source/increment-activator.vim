" TOML: operator.toml
" Repo: nishigori/increment-activator
" Another: source/increment-activator.vim

let g:increment_activator_no_default_key_mappings = 1

let g:increment_activator_filetype_candidates = {}

let g:increment_activator_filetype_candidates['_'] = [
      \ ['==', '!='],
      \
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
      \ ['lower', 'upper'],
      \ ]

let g:increment_activator_filetype_candidates['java'] = [
      \ ['private', 'protected', 'public'],
      \ ]

let g:increment_activator_filetype_candidates['vim'] = [
      \ ['nmap', 'xmap'],
      \ ['imap', 'cmap', 'tmap'],
      \
      \ ['nnoremap', 'xnoremap'],
      \ ['inoremap', 'cnoremap', 'tnoremap'],
      \
      \ ['<silent>', '<script>'],
      \
      \ ['\zs', '\ze'],
      \ ]
