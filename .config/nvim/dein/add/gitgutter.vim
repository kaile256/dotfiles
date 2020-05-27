" TOML: git.toml
" Repo: airblade/vim-gitgutter
" Another: source/gitgutter.vim

command! -bar PreviewHunk :GitGutterPreviewHunk

" default: [c and ]c without g:gitgutter_map_keys
nmap [c <Plug>(GitGutterPrevHunk)
nmap ]c <Plug>(GitGutterNextHunk)

nmap U <Plug>(GitGutterUndoHunk)

nnoremap <expr><silent> <SID>(gitgutter-stage-hunks)
      \ (foldclosed(line('.')) == -1 ? ':<C-u>' : 'V') . ':GitGutterStageHunk<CR>'

nmap <space>gp <SID>(gitgutter-stage-hunks)
nmap <silent> <space>gP <SID>(gitgutter-stage-hunks):<C-u>GcommitBottom<CR>

xmap <silent> <space>gp :<C-u>call <SID>stage_hunks_in_range()<CR>
xmap <silent> <space>gP
      \ :<C-u>call <SID>stage_hunks_in_range()<CR>:<C-u>GcommitBottom<CR>

function! s:stage_hunks_in_range() abort
  let save_view = winsaveview()
  norm! '<
  while line('.') < line("'>")
    let lnum = line('.')
    silent! GitGutterStageHunk
    silent! GitGutterNextHunk
    if lnum == line('.')
      break
    endif
  endwhile
  call winrestview(save_view)
endfunction

omap <SID>(textobj-hunk-i) <Plug>(GitGutterTextObjectInnerPending)
xmap <SID>(textobj-hunk-i) <Plug>(GitGutterTextObjectInnerVisual)
omap <SID>(textobj-hunk-a) <Plug>(GitGutterTextObjectOuterPending)
xmap <SID>(textobj-hunk-a) <Plug>(GitGutterTextObjectOuterVisual)

omap ic <SID>(textobj-hunk-i)
xmap ic <SID>(textobj-hunk-i)
omap ac <SID>(textobj-hunk-a)
xmap ac <SID>(textobj-hunk-a)
