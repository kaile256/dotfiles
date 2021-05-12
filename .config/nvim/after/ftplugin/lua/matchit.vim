" Ref: /usr/share/nvim/runtime/ftplugin/lua.vim

if !exists('g:loaded_matchit') | finish | endif

let b:match_ignorecase = 0

let b:match_words =
  \ '\<\%(do\|function\|if\)\>:' .
  \ '\<\%(return\|else\|elseif\)\>:' .
  \ '\<end\>,' .
  \ '\<repeat\>:\<until\>'

if expand('%:t') =~# '_spec\.lua$'
  " For busted/plenary test.
  let b:match_words .= ','.
    \ '\<\%(\%(describe\|it\)(\ze.*function()$\)'
    \ .'\|\%(before_each\|after_each\|setup\|teardown\)'
    \ .'('
    \ .':\<end\zs)'
endif
