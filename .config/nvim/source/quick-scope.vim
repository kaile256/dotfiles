" From: motion.toml
" Repo: unblevable/quick-scope

let g:qs_lazy_highlight = 1

let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

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

hi QuickScopePrimary   guifg=#afff5f gui=underline ctermfg=155 cterm=underline
hi QuickScopeSecondary guifg=#5fffff gui=underline ctermfg=81  cterm=underline

augroup myQuickScopeColors
  au!
  au ColorScheme * ++nested hi QuickScopePrimary   guifg=#afff5f gui=underline ctermfg=155 cterm=underline
  au ColorScheme * ++nested hi QuickScopeSecondary guifg=#5fffff gui=underline ctermfg=81  cterm=underline
augroup END
