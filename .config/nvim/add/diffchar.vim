" From: extension.toml
" Repo: rickhowe/diffchar.vim

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

let g:DiffColors = 100  " all available colors in dynamic random order
let g:DiffExpr = 0
