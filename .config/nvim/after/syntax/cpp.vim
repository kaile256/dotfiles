" Ref: $VIMRUNTIME/syntax/cpp.vim
" Ref: ftplugin/cpp.vim

" Note: `runtime! syntax/c.vim` is done under $VIMRUNTIME/syntax/cpp.vim

syn match cppIostream '\s[<>]\{2}\s'
" syn match cppArrow '\S\+\zs->\ze\S\+'
syn match cppPointer2Member '\S\+->\zs[^ \t()]\+'
syn keyword cppMacroType ll lli lint LL LLI

hi! link cppIostream Type
hi! link cppPointer2Member Function
hi! link cppMacroType Type

