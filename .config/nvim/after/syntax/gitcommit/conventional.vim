finish
" The syntax configurations are based on conventional-commit
" Ref: https://www.conventionalcommits.org/en/v1.0.0/

let s:conventional_types = '\('. join([
      \ 'chore',
      \ 'docs',
      \ 'feat',
      \ 'fix',
      \ 'perf',
      \ 'refactor',
      \ 'style',
      \ 'test',
      \ ], '\|') .'\)'

exe 'syn region gitcommitConventional'
      \ 'start=+^'. s:conventional_types .'+'
      \ 'end=+:+'
      \ 'oneline'
      \ 'contained'
      \ 'containedin=gitcommitFirstline'
      \ 'contains=gitcommitConventionalColon,gitcommitConventionalBang,gitcommitConventionalType,gitcommitConventionalScope'

syn match gitcommitConventionalColon ':' contained containedin=gitcommitConventional skipwhite
syn match gitcommitConventionalBang '!\zs.\{-}:' contained containedin=gitcommitConventional skipwhite
exe 'syn match gitcommitConventionalType'
      \ '+^'. s:conventional_types .'\ze\(:\|(\)+'
      \ 'contained containedin=gitcommitConventional skipempty'
exe 'syn match gitcommitConventionalScope'
      \ '+^'. s:conventional_types .'(\zs.\{-}\ze)+'
      \ 'contained containedin=gitcommitConventional skipempty'

syn match gitcommitConventionalBreakingChange 'BREAKING CHAHGE'

hi! link gitcommitConventionalType Function
hi! gitcommitConventionalScope ctermfg=15 guifg=#ffffff cterm=bold gui=bold

hi! gitcommitConventionalBang ctermfg=15 guifg=#ffffff cterm=bold gui=bold
hi! link gitcommitConventionalBreakingChange Error
