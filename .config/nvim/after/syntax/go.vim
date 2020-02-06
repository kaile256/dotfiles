" Orig: /usr/share/nvim/runtime/syntax/go.vim

"syn match pythonVariable "^\s*\w\+\s\ze=\+\s"
" Note: no use on \.\zs
syn match goFunctionGlobal "\.\zs[^.(),[ \t]\+\ze[()]"
syn match goFunctionLocal "\s\l\a\+\ze("
syn match goChild "\.\zs[^.(),[ \t]\+\ze[ =]"
"syn match goVariableLocal "[ \t]\zs\l\a\+\ze\s"

hi! def link goChild Identifier
hi! def link goFunctionGlobal Function
hi! def link goFunctionLocal Type
"hi! def link goVariableLocal PreProc
