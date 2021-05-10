" TOML: git.toml
" Repo: airblade/vim-gitgutter

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

if dein#tap('vim-textobj-conflict')
  function! s:is_conflicted() abort
    const conflict_marker = '^[=><]\{7} '
    const is_conflicted = search(conflict_marker, 'cnw')
    return is_conflicted
  endfunction

  omap <expr> ic <SID>is_conflicted() ? '<Plug>(textobj-conflict-i)' : '<SID>(textobj-hunk-i)'
  xmap <expr> ic <SID>is_conflicted() ? '<Plug>(textobj-conflict-i)' : '<SID>(textobj-hunk-i)'
  omap <expr> ac <SID>is_conflicted() ? '<Plug>(textobj-conflict-a)' : '<SID>(textobj-hunk-a)'
  xmap <expr> ac <SID>is_conflicted() ? '<Plug>(textobj-conflict-a)' : '<SID>(textobj-hunk-a)'
else
  omap ic <SID>(textobj-hunk-i)
  xmap ic <SID>(textobj-hunk-i)
  omap ac <SID>(textobj-hunk-a)
  xmap ac <SID>(textobj-hunk-a)
endif

