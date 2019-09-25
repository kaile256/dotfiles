" From: tool.toml

let g:undotree_CustomUndotreeCmd  = 'belowright vertical 30 new'
let g:undotree_CustomDiffpanelCmd = 'botright 10 new'
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators    = 1

nnoremap <silent> <a-u> :<c-u>UndotreeToggle<cr>

"augroup MyUndotree
"  au!
"  au FileType undotree setl bt=quickfix
"augroup END
