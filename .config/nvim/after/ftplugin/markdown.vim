" From: filetype.vim

setl nowrap fdl=1 conceallevel=0
setl tabstop=4 softtabstop=4 shiftwidth=4

hi! link htmlLink Statement
hi! link markdownHeadingDelimiter PreProc

hi! link TrailingSpacesOnce  DiffText
hi! link TrailingSpacesTwice PmenuThumb
hi! link TrailingSpacesMore  DiffText

let b:markdownSpaces = matchadd('TrailingSpacesOnce',  '\S\zs $')
let b:markdownSpaces = matchadd('TrailingSpacesTwice', '\S\zs  $')
let b:markdownSpaces = matchadd('TrailingSpacesMore',  '\S\zs   \+$')
