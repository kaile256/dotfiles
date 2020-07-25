" Ref: $VIMRUNTIME/syntax/c.vim
" Ref: syntax/cpp.vim

let g:c_gnu = 1
let g:c_autodoc = 1
let g:c_comment_strings = 1

syn match cOperatorBoolean '\s[&|]\{2}\s'
syn match cOperatorBitwise '[&|^~]\|[<>]\{2}'

hi! link cOperatorBoolean cOperator
hi! link cOperatorBitwise cOperator

