" From: motion.toml
" Repo: andymass/vim-matchup
" Another: source/matchup.vim

" Without them, sometimes fails to set up for matchup.vim
let g:loaded_matchit    = 1
let g:loaded_matchparen = 1

" Note: the matchup-detected signs sometimes work like a fold sign
nnoremap <silent> z<c-g> :<c-u>MatchupWhereAmI??<cr>

"omap <silent><expr> a%
"      \ (v:operator ==# 'd')? '<esc><Plug>(matchup-ds%)':
"      \ (v:operator ==# 'c')? '<esc><Plug>(matchup-cs%)':
"      \ '<Nop>'
"
"" map i% as provided a%.
"omap <silent> i% <Plug>(matchup-o_)<Plug>(matchup-a%)
