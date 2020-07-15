" The syntax configurations are based on conventional-commit
" Ref: https://www.conventionalcommits.org/en/v1.0.0/

syn match gitcommitType '^\l\+\ze\(:\|(\)'
syn match gitcommitScope '^\l\+(\zs.\{-})'
syn match gitcommitBang '!\zs.\{-}:'
syn match gitcommitBreakingChange 'BREAKING CHAHGE'

hi! link gitcommitType Function
hi! link gitcommitBreakingChange ErrorMsg
hi! gitcommitBang ctermfg=15 guifg=#ffffff cterm=bold gui=bold
