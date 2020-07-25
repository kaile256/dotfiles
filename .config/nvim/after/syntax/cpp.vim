" Ref: $VIMRUNTIME/syntax/cpp.vim
" Ref: ftplugin/cpp.vim

" Note: `runtime! syntax/c.vim` is done under $VIMRUNTIME/syntax/cpp.vim

syn match cppTemplateFunction '\<\h\w\+\ze<\w\+>('

syn region cppIostream start='\(cin\|cout\)' end=';' skipwhite skipnl skipempty
syn match  cppOperatorIostream '[<>]\{2}' containedin=cppIostream

" syn match cppArrow '\S\+\zs->\ze\S\+'
syn match cppPointer2Member '\S\+->\zs[^ \t()]\+'
syn keyword cppMacroType ll lli lint LL LLI

hi! link cppTemplateFunction cUserFunction
hi! link cppOperatorIostream Type
hi! link cppPointer2Member Function
hi! link cppMacroType Type

