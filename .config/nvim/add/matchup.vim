" From: motion.toml
" Repo: andymass/vim-matchup
" Another: post/matchup.vim

"let g:loaded_matchit    = 1
"let g:loaded_matchparen = 1

let g:matchup_mouse_enabled  = 0
let g:matchup_delim_stopline = 500

"let g:matchup_surround_enabled = 1 " 1: provides maps ds% and cs%
"let g:matchup_text_obj_linewise_operators = ['d', 'y', ]

" Note: the matchup-detected signs sometimes work like a fold sign
nnoremap <silent> z<c-g> :<c-u>MatchupWhereAmI??<cr>

"omap <silent><expr> a%
"      \ (v:operator ==# 'd')? '<esc><Plug>(matchup-ds%)':
"      \ (v:operator ==# 'c')? '<esc><Plug>(matchup-cs%)':
"      \ '<Nop>'
"
"" map i% as provided a%.
"omap <silent> i% <Plug>(matchup-o_)<Plug>(matchup-a%)
