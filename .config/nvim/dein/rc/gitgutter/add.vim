" TOML: git.toml
" Repo: airblade/vim-gitgutter
" Another: source/gitgutter.vim

command! -bar PreviewHunk :GitGutterPreviewHunk

" default: [c and ]c with g:gitgutter_map_keys=1.
if dein#tap('repmo-vim')
  map <expr> [c repmo#Key('<Plug>(GitGutterPrevHunk)', '<Plug>(GitGutterNextHunk)')
  map <expr> ]c repmo#Key('<Plug>(GitGutterNextHunk)', '<Plug>(GitGutterPrevHunk)')
else
  map [c <Plug>(GitGutterPrevHunk)
  map ]c <Plug>(GitGutterNextHunk)
endif

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
