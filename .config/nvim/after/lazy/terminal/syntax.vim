if &bt !=# 'terminal' | finish | endif

syn match yayPkgAur 'aur/\zs\S*'
syn match yayPkgCommunity 'community/\zs\S*'
syn match yayPkgExtra 'extra/\zs\S*'
syn match yayPkgInstalled '(\zsInstalled\ze.*)'

hi! link yayPkgAur Identifier
hi! link yayPkgCommunity Title
hi! link yayPkgExtra     Statement
hi! link yayPkgInstalled Statement

syn match yayInstalling 'Installing \zs.*\ze\.\.\.'
hi! link yayInstalling Title

