" From: filetype.vim

setl nowrap fdl=1 conceallevel=0
setl tabstop=4 softtabstop=4 shiftwidth=4

hi! link htmlLink Statement
hi! link markdownHeadingDelimiter PreProc

hi! link TrailingSpacesOnce DiffText
hi! TrailingSpacesTwice cterm=reverse gui=reverse
hi! link TrailingSpacesMore DiffText

let w:markdownSpaces = matchadd('TrailingSpacesOnce',  '\S\zs $')
let w:markdownSpaces = matchadd('TrailingSpacesTwice', '\S\zs  $')
let w:markdownSpaces = matchadd('TrailingSpacesMore',  '\S\zs   \+$')
