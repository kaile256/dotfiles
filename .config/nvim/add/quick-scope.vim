" From: motion.toml
" Repo: unblevable/quick-scope

"let g:qs_lazy_highlight = 1

let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
"let g:qs_highlight_on_keys = ['f', 'F']

augroup myQuickScopeColors
  au!
  au ColorScheme * hi QuickScopePrimary   guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
  au ColorScheme * hi QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81  cterm=underline
augroup END
