" TOML: default.toml
" Repo: liuchengxu/vim-which-key
" Another: add/which-key.vim

let g:which_key_map = {}

if dein#tap('vim-caser')
  let g:which_key_map['\u'] = {
        \ 'name': '+caser',
        \
        \ 't': ['<Plug>CaserTitleCase',    'Title Case'],
        \ '(': ['<Plug>CaserSentenceCase', 'Start a sentence'],
        \ ')': ['<Plug>CaserSpaceCase',    'continue a sentence'],
        \
        \ 'p': ['<Plug>CaserMixedCase', 'PascalCase'],
        \ 'c': ['<Plug>CaserCamelCase', 'camelCase'],
        \
        \ '_': ['<Plug>CaserSnakeCase', 'snake_case'],
        \ 'U': ['<Plug>CaserUpperCase', 'UPPER_CASE'],
        \
        \ '-': ['<Plug>CaserKebabCase', 'kebab-case'],
        \ '.': ['<Plug>CaserDotCase',   'dot.separated']
        \ }

endif

augroup myWhichKey
  " au FileType which_key set laststatus=0 noshowmode noruler
  " au FileType which_key au BufLeave <buffer> setlocal laststatus=2 showmode ruler
augroup END

let g:which_key_vertical = 1
