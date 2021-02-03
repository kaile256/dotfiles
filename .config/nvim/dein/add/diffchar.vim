" From: default.toml
" Repo: rickhowe/diffchar.vim

command! -range -bar DiffCharShow
        \ call diffchar#ShowDiffChar(range(<line1>, <line2>))
command! -range -bar DiffCharReset
        \ call diffchar#ResetDiffChar(range(<line1>, <line2>))
command! -range -bar DiffCharToggle
        \ call diffchar#ToggleDiffChar(range(<line1>, <line2>))
command! -range -bang -bar DiffCharEcho
        \ call diffchar#EchoDiffChar(range(<line1>, <line2>), <bang>1)

let g:DiffColors = 1  " all available colors in dynamic random order
let g:DiffExpr   = 0

