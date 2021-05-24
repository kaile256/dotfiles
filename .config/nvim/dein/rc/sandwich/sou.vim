" From: operator.toml
" Repo: machakann/vim-sandwich
" Fork: kaile256/vim-sandwich

hi! OperatorSandwichAdd    cterm=reverse gui=reverse ctermfg=142 guifg=#b8bb26
hi! OperatorSandwichChange cterm=reverse gui=reverse ctermfg=108 guifg=#8ec07c
hi! OperatorSandwichDelete cterm=reverse gui=reverse ctermfg=167 guifg=#fb4934

let g:sandwich_no_default_key_mappings          = 1
let g:operator_sandwich_no_default_key_mappings = 1
let g:textobj_sandwich_no_default_key_mappings  = 1

let g:operator#sandwich#timeoutlen = 1500 " default: &timeoutlen (=1000ms).

" For example, foo.bar(), baz['qux'](), quux.corge['grault'].garply[...]()
let g:sandwich#magicchar#f#patterns = [
      \ {
      \   'header' : '\<\h\k*\%(\.\h\k*\|\[.\{-}\]\)*',
      \   'bra'    : '(',
      \   'ket'    : ')',
      \   'footer' : '',
      \ },
      \ ]

function! s:append_global_recipes(bufnr) abort
  let bufnr = a:bufnr
  let local_recipes = getbufvar(bufnr, 'sandwich_recipes')
  if !empty(local_recipes)
    let new_recipes = g:sandwich#recipes + local_recipes
    call setbufvar(bufnr, 'sandwich_recipes', new_recipes)
  endif

  let local_f_patterns = getbufvar(bufnr, 'sandwich_magicchar_f_patterns')
  if !empty(local_f_patterns)
    let new_fpats = g:sandwich#magicchar#f#patterns + local_f_patterns
    call setbufvar(bufnr, 'sandwich_magicchar_f_patterns', new_fpats)
  endif
endfunction

" Because of lazy-load, recipes and f_patterns possibly defined such as in
" ftplugin/ are incomplete; append global ones which are defined just after
" this plugin has been loaded.
for s:bufnr in range(1, bufnr('$'))
  call s:append_global_recipes(s:bufnr)
endfor
unlet s:bufnr

augroup mySandwich/appendGlobalRecipes
  au FileType * call s:append_global_recipes(bufnr())
augroup END
