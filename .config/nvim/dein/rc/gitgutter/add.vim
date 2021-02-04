" TOML: git.toml
" Repo: airblade/vim-gitgutter
" Another: source/gitgutter.vim

command! -bar PreviewHunk :GitGutterPreviewHunk

noremap <SID>[c [c
noremap <SID>]c ]c
map <expr> <Plug>(gitgutter-hunk-raw-next) &diff ? '<SID>]c' : '<Plug>(GitGutterNextHunk)'
map <expr> <Plug>(gitgutter-hunk-raw-prev) &diff ? '<SID>[c' : '<Plug>(GitGutterPrevHunk)'
if dein#tap('repmo-vim')
  map <expr> <Plug>(gitgutter-hunk-next) repmo#Key('<Plug>(gitgutter-hunk-raw-prev)', '<Plug>(gitgutter-hunk-raw-next)')
  map <expr> <Plug>(gitgutter-hunk-prev) repmo#Key('<Plug>(gitgutter-hunk-raw-next)', '<Plug>(gitgutter-hunk-raw-prev)')
else
  map <expr> <Plug>(gitgutter-hunk-next) <Plug>(gitgutter-hunk-raw-next)
  map <expr> <Plug>(gitgutter-hunk-prev) <Plug>(gitgutter-hunk-raw-prev)
endif
map [c <Plug>(gitgutter-hunk-next)
map ]c <Plug>(gitgutter-hunk-prev)

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
