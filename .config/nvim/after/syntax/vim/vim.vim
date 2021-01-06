" Runtime: $VIMRUNTIME/syntax/vim.vim

syn keyword vimLet const skipwhite nextgroup=vimVar,VimFuncVar

syn match vimComment contained containedin=vimMapRhs ' | ".*$'
