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

" TODO: keep both DiffChange & DiffText from sometimes being overrided
"       autoload/diffchar.vim @1607 as ':verbose highlight DiffChange'
" Tried: deleted '' for v:val
"augroup DiffChar
"  au!
"  au OptionSet if &diff && exists(':DiffCharShow') | DiffCharShow | endif
"  au OptionSet if &diff && exists(':SDChar')       | SDChar       | endif
"
"  au DiffUpdated if exists(':DiffCharReset') | DiffCharReset | endif
"  au DiffUpdated if exists(':RDChar')        | RDChar        | endif
"augroup END

"augroup DiffCharResetFoldMethod
"  au! OptionSet diff
"        \ if &fdm == 'expr'
"        \  | setl fdm=syntax
"        \  | au OptionSet diff ++once setl fdm=expr
"        \ | endif
"augroup END
