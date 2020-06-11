" Ref: $VIMRUNTIME/syntax/cpp.vim
" Ref: syntax/cpp.vim

" Note: `runtime! syntax/c.vim` is done under $VIMRUNTIME/syntax/cpp.vim

syn match cppIostream '\s[<>]\{2}\s'
syn keyword cppMacroType ll lli lint LL LLI

hi! link cppIostream Type
hi! link cppMacroType Type

