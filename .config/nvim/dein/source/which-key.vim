" TOML: default.toml
" Repo: liuchengxu/vim-which-key
" Another: add/which-key.vim

function! s:register_keys() abort
  let l:map = {
        \ '<space>': [],
        \ }

  if dein#tap('vim-caser')
    let l:map['\u'] = {
          \ 'name': '[arthurxavierx/vim-caser]',
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
          \ '.': ['<Plug>CaserDotCase',   'dot.separated'],
          \ }
  endif

  for key in keys(l:map)
    call which_key#register(key, l:map[key])
  endfor
endfunction
call s:register_keys()
delfunction s:register_keys
