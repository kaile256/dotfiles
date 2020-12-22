" TOML: git.toml
" Repo: airblade/vim-gitgutter
" Another: source/gitgutter.vim

command! -bar PreviewHunk :GitGutterPreviewHunk

" default: [c and ]c without g:gitgutter_map_keys
silent! nmap <unique> [c <Plug>(GitGutterPrevHunk)
silent! nmap <unique> ]c <Plug>(GitGutterNextHunk)

" TODO: Make prev/next hunk work on Visual mode.
silent! xmap <unique> [c <Plug>(GitGutterPrevHunk)
silent! xmap <unique> ]c <Plug>(GitGutterNextHunk)

nmap [C <Plug>(GitGutterPrevHunk)<SID>(gitgutter-stage-hunks)
nmap ]C <Plug>(GitGutterNextHunk)<SID>(gitgutter-stage-hunks)

" Staging Hunks {{{1
nmap <silent> U
      \ <Plug>(GitGutterUndoHunk):<C-u>silent!
      \ call repeat#set("\<lt>Plug>(GitGutterUndoHunk)")<CR>

" Text-object {{{1
omap <SID>(textobj-hunk-i) <Plug>(GitGutterTextObjectInnerPending)
xmap <SID>(textobj-hunk-i) <Plug>(GitGutterTextObjectInnerVisual)
omap <SID>(textobj-hunk-a) <Plug>(GitGutterTextObjectOuterPending)
xmap <SID>(textobj-hunk-a) <Plug>(GitGutterTextObjectOuterVisual)

omap ic <SID>(textobj-hunk-i)
xmap ic <SID>(textobj-hunk-i)
omap ac <SID>(textobj-hunk-a)
xmap ac <SID>(textobj-hunk-a)
