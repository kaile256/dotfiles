" From: motion.toml
" Repo: andymass/vim-matchup
" Another: source/matchup.vim
" Ref: $VIMRUNTIME/pack/dist/opt/matchit/plugin/matchit.vim

" Without them, sometimes fails to set up for matchup.vim
let g:loaded_matchit    = 1
let g:loaded_matchparen = 1

" Note: the matchup-detected signs sometimes work like a fold sign
nnoremap <silent> z<c-g> :<c-u>MatchupWhereAmI??<cr>
imap <C-o>g% <plug>(matchup-c_g%)

let g:matchup_surround_enabled = 1
nmap \d% <plug>(matchup-ds%)
nmap \c% <plug>(matchup-cs%)
