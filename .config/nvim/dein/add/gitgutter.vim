" TOML: git.toml
" Repo: airblade/vim-gitgutter
" Another: source/gitgutter.vim

" default: [c and ]c without g:gitgutter_map_keys
nmap [c <Plug>(GitGutterPrevHunk)
nmap ]c <Plug>(GitGutterNextHunk)

nmap U <Plug>(GitGutterUndoHunk)
nmap <space>gp <Plug>(GitGutterStageHunk)
xmap <space>gp <Plug>(GitGutterStageHunk)

omap <SID>(textobj-hunk-i) <Plug>(GitGutterTextObjectInnerPending)
xmap <SID>(textobj-hunk-i) <Plug>(GitGutterTextObjectInnerVisual)
omap <SID>(textobj-hunk-a) <Plug>(GitGutterTextObjectOuterPending)
xmap <SID>(textobj-hunk-a) <Plug>(GitGutterTextObjectOuterVisual)

omap ic <SID>(textobj-hunk-i)
xmap ic <SID>(textobj-hunk-i)
omap ac <SID>(textobj-hunk-a)
xmap ac <SID>(textobj-hunk-a)

