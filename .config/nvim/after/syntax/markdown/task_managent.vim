syn match mkdTaskDone '^\s*- \[x] .\+' skipwhite
hi! link mkdTaskDone NonText

syn match mkdTaskInProgress '^\s*- \[ ] .\+' skipwhite
syn match mkdTaskMarkInProgress '^\s*- \[ ]\ze .\+' skipwhite skipnl containedin=mkdTaskInProgress
hi! link mkdTaskMarkInProgress NonText
