" From: motion.toml
" Repo: andymass/vim-matchup
" Another: add/matchup.vim

let g:matchup_matchparen_nomode = 'i' " modes where matchup should be disabled

let g:matchup_mouse_enabled  = 0
let g:matchup_delim_stopline = 500

" let g:matchup_matchparen_deferred = 1
" let g:matchup_matchparen_hi_surround_always = 1 " requires '_defferred'=1
" if get(g:, 'matchup_matchparen_hi_surround_always')
"   let g:matchup_matchparen_deferred_show_delay = 150
" else
"   let g:matchup_matchparen_deferred_show_delay = 50
" endif

" let g:matchup_matchparen_hi_background = 1
" hi! MatchBackground guibg=#262626 ctermbg=235
" hi! MatchBackground guibg=#4e4e4e ctermbg=239

let g:matchup_matchparen_offscreen = {}

"let g:matchup_surround_enabled = 1 " 1: provides maps ds% and cs%
"let g:matchup_text_obj_linewise_operators = ['d', 'y', ]


