" TOML: default.toml
" Repo: liuchengxu/vim-which-key
" Another: add/which-key.vim

let s:which_key_map = {
      \ '<space>': [],
      \ }

if dein#tap('vim-caser')
  let s:which_key_map['\u'] = {
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

augroup myWhichKey
  " au FileType which_key set laststatus=0 noshowmode noruler
  " au FileType which_key au BufLeave <buffer> setlocal laststatus=2 showmode ruler
augroup END

function! s:register() abort
  for key in keys(s:which_key_map)
    call which_key#register(key, s:which_key_map[key])
  endfor
endfunction
call s:register()
delfunction s:register
