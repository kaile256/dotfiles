" Runtime: $VIMRUNTIME/syntax/vim.vim

syn keyword vimLet const skipwhite nextgroup=vimVar,VimFuncVar

syn match vimBarComment contained containedin=vimMapRhs ' | ".*$'
hi! link vimBarComment vimComment

