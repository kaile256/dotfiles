" Orig: /usr/share/nvim/runtime/syntax/java.vim

syn match javaFunction "\w\+\ze("

syn match javaTypeUser "^\s*\zs\w\+\ze\s\+\w\+\s\+="

hi link javaFunction Function
hi link javaTypeUser PreProc

" override original
hi link javaC_Java javaTypeUser
hi link javaOperator Type
