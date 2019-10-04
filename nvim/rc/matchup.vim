" From: appearance.toml
" Alter: post/matchup.vim

let g:loaded_matchparen = 1

let g:matchup_surround_enabled = 1 " 1: provides maps ds% and cs%
"let g:matchup_text_obj_linewise_operators = ['d', 'y', ]

nnoremap <silent> z<c-f> :MatchupWhereAmI??<cr>
nnoremap <silent> <c-9>  :MatchupWhereAmI??<cr>
nnoremap <silent> <c-0>  :MatchupWhereAmI??<cr>
