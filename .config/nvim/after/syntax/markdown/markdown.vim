" From: filetype.vim
" BuiltIn: runtime/syntax/markdown.vim
" Another: ftplugin/markdown.vim

"hi! link htmlLink Statement

hi! link mkdCodeStart Comment
hi! link mkdCodeEnd   Comment
hi! link mkdURL Comment
hi! link markdownLinkUrl Comment

hi! link markdownHeadingDelimiter PreProc

" for Items in markdown {{{1
hi! link markdownItemLineDone Comment
syn region markdownItemLineDone start='^=\s*\[x]\c' end='^\s*\[' contains=markdownItemDelimiter

" for trailingSpaces "{{{1
hi! link TrailingSpacesOnce  DiffText
hi! link TrailingSpacesTwice PmenuThumb
hi! link TrailingSpacesMore  DiffText

let b:trailingSpaces = matchadd('TrailingSpacesOnce',  '\S\zs $')
let b:trailingSpaces = matchadd('TrailingSpacesTwice', '\S\zs  $')
let b:trailingSpaces = matchadd('TrailingSpacesMore',  '\S\zs   \+$')

