" The syntax configurations are based on conventional-commit
" Ref: https://www.conventionalcommits.org/en/v1.0.0/

" FIXME: make Type/Scope highlighted
syn match gitcommitType '^\l\+\ze\(:\|(\)' containedin=gitcommitSummary
syn match gitcommitScope '^\l\+(\zs.\{-}\ze)' containedin=gitcommitSummary

syn match gitcommitBang '!\zs.\{-}:'
syn match gitcommitBreakingChange 'BREAKING CHAHGE'

hi! link gitcommitType Function
hi! gitcommitScope ctermfg=15 guifg=#ffffff cterm=bold gui=bold

hi! gitcommitBang ctermfg=15 guifg=#ffffff cterm=bold gui=bold
hi! link gitcommitBreakingChange Error
