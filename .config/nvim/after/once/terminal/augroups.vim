augroup myOnce/Terminal/WorkaroundToKeepCursorHighlight
  au FocusLost term://* if mode() !=# 'n' |
        \ call feedkeys("\<C-\>\<C-n>i", 'n')
        \ | endif
augroup END
