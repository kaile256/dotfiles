" From: motion.toml
" Repo: andymass/vim-matchup
" Another: post/matchup.vim

let g:loaded_matchparen = 1

"let g:matchup_surround_enabled = 1 " 1: provides maps ds% and cs%
"let g:matchup_text_obj_linewise_operators = ['d', 'y', ]

nnoremap <silent> z<c-f> :MatchupWhereAmI??<cr>
nnoremap <silent> <c-9>  :MatchupWhereAmI??<cr>
nnoremap <silent> <c-0>  :MatchupWhereAmI??<cr>

omap <silent><expr> a%
      \ (v:operator ==# 'd')? '<esc><Plug>(matchup-ds%)':
      \ (v:operator ==# 'c')? '<esc><Plug>(matchup-cs%)':
      \ '<Nop>'

" map i% as provided a%.
omap <silent> i% <Plug>(matchup-o_)<Plug>(matchup-a%)
