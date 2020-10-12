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

nnoremap <expr><silent> <SID>(gitgutter-stage-current-hunk)
      \ (foldclosed(line('.')) == -1 ? ':<C-u>' : 'V')
      \ .':GitGutterStageHunk<CR>'
nnoremap <silent> <SID>(gitgutter-stage-hunks-op)
      \ :<C-u>set operatorfunc=<SID>stage_hunks_op<CR>g@

nmap <space>gpp <SID>(gitgutter-stage-current-hunk)
nmap <space>gp <SID>(gitgutter-stage-hunks-op)
nmap <silent> <space>gP <SID>(gitgutter-stage-hunks):<C-u>GcommitBottom<CR>

xmap <silent> <space>gp :<C-u>call <SID>stage_hunks_in_range("'<", "'>")<CR>
xmap <silent> <space>gP :<C-u>call <SID>stage_hunks_in_range("'<'"","'>")<bar>
      \ GcommitBottom<CR>

function! s:stage_hunks_op(wise) abort
  call s:stage_hunks_in_range("'[", "']")
endfunction

function! s:stage_hunks_in_range(start, end) abort "{{{2
  " a:start: lnum
  " a:end: lnum

  let save_view = winsaveview()
  exe 'norm!' a:start
  while line('.') <= line(a:end)
    let lnum = line('.')
    silent! GitGutterStageHunk
    silent! GitGutterNextHunk

    if lnum == line('.') | break | endif
  endwhile
  call winrestview(save_view)
endfunction

" Text-object {{{1
omap <SID>(textobj-hunk-i) <Plug>(GitGutterTextObjectInnerPending)
xmap <SID>(textobj-hunk-i) <Plug>(GitGutterTextObjectInnerVisual)
omap <SID>(textobj-hunk-a) <Plug>(GitGutterTextObjectOuterPending)
xmap <SID>(textobj-hunk-a) <Plug>(GitGutterTextObjectOuterVisual)

omap ic <SID>(textobj-hunk-i)
xmap ic <SID>(textobj-hunk-i)
omap ac <SID>(textobj-hunk-a)
xmap ac <SID>(textobj-hunk-a)
