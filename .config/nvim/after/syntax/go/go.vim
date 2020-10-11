" Orig: /usr/share/nvim/runtime/syntax/go.vim

"syn match pythonVariable "^\s*\w\+\s\ze=\+\s"
" Note: no use on \.\zs
syn match goFunctionLocal "\l\w\+\ze("
syn match goFunctionGlobal "\u\w\+\ze("
"syn match goChild "\.\zs\w\+\ze[ =,()[]"
"syn match goVariableLocal "[ \t]\zs\l\a\+\ze\s"

hi! def link goChild Identifier
hi! def link goFunctionGlobal Function
hi! def link goFunctionLocal preProc
"hi! def link goVariableLocal PreProc
