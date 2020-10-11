" Orig: /usr/share/nvim/runtime/syntax/python.vim

"syn match pythonVariable "^\s*\w\+\s\ze=\+\s"
" Note: no use on \.\zs; probably, some default sytax match prevents it
syn match pythonMethod "\.[^.(),[ \t]\+\ze[()]"
syn match pythonFunctionGlobal "\u\a\+\ze("

"hi def link pythonVariable Identifier
hi def link pythonMethod Function
"hi def link pythonFunctionGlobal Identifier
hi def link pythonFunctionGlobal Type
"hi def link pythonFunctionGlobal PreProc
