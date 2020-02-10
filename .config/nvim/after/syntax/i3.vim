"syn match i3VarKey "\$\u\l\w\+" skipwhite
"syn match i3VarEnv "\$\u\+\ze\([ +]\|$\)" skipwhite
"syn match i3VarExec "\$\l\+" skipwhite
"
""hi link i3VarKey Identifier
"hi link i3VarEnv Type
"hi link i3VarExec Define
