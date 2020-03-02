" From: motion.toml
" Repo: unblevable/quick-scope
" Else: source/quick-scope.vim

" list of chars which quick-scope will highlight
for char in split("!@#$%^&*()_+-=[]{};:'\",./<>?\\\|", '\zs')
  call add(g:qs_accepted_chars, char)
endfor

" let g:qs_highlight_on_keys = [
"     \ "\<Plug>(sneak-f)",
"     \ "\<Plug>(sneak-F)",
"     \ "\<Plug>(sneak-t)",
"     \ "\<Plug>(sneak-T)",
"     \ ]

" let g:qs_highlight_on_keys = [
"      \ '<Plug>(sneak-f)',
"      \ '<Plug>(sneak-F)',
"      \ '<Plug>(sneak-t)',
"      \ '<Plug>(sneak-T)',
"      \ ]

hi QuickScopePrimary   gui=bold,underline cterm=bold,underline guifg=#afff5f ctermfg=155
hi QuickScopeSecondary gui=bold,underline cterm=bold,underline guifg=#5fffff ctermfg=81
