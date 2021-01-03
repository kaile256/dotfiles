" From: filetype.vim
" BuiltIn: $VIMRUNTIME/syntax/markdown.vim
" Another: ftplugin/markdown.vim

hi! markdownCodeDelimiter ctermfg=103 guifg=#8090a0 cterm=underline gui=underline

"hi! link htmlLink Statement
hi! link markdownLinkUrl Comment

hi! link markdownHeadingDelimiter PreProc

" for trailingSpaces "{{{1
hi! link TrailingSpacesTwice PmenuThumb
hi! TrailingSpacesOnce ctermbg=red guibg=red
hi! TrailingSpacesMore ctermbg=red guibg=red

let b:trailingSpaces = matchadd('TrailingSpacesOnce',  '\S\zs $')
let b:trailingSpaces = matchadd('TrailingSpacesTwice', '\S\zs  $')
let b:trailingSpaces = matchadd('TrailingSpacesMore',  '\S\zs   \+$')

