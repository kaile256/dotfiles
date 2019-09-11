" From: appearance.toml

"let g:loaded_matchparen = 1

hi MatchParen ctermbg=6 guifg=white guibg=#d5231f
"hi link MatchParen String

"let g:matchup_surround_enabled = 1 " 1: provides maps ds% and cs%
"let g:matchup_text_obj_linewise_operators = ['d', 'y', ]

nnoremap <silent> z<c-f> :MatchupWhereAmI??<cr>
nnoremap <silent> <c-9>  :MatchupWhereAmI??<cr>
nnoremap <silent> <c-0>  :MatchupWhereAmI??<cr>
