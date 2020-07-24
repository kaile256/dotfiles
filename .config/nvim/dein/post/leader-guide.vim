" TOML: default.toml
" Repo: hecal3/vim-leader-guide

" Format:
" g:lmap.b = {'name': 'buffers'}
let s:LG_mappings = {}

let s:LG_mappings['\u'] = {
      \ 'name': 'Caser',
      \
      \ '<space>': ['<Plug>CaserSpaceCase', 'Reset sentence normally'],
      \ }

call leaderGuide#register_prefix_descriptions('\u', s:LG_mappings)
unlet s:LG_mappings
